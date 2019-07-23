<?php
/**
 * @author Retail Driver LCC
 * @copyright RetailCRM
 * @license GPL
 * @version 1.0.0
 * @link https://simlachat.com
 *
 */

if (function_exists('date_default_timezone_set') && function_exists('date_default_timezone_get')) {
    date_default_timezone_set(@date_default_timezone_get());
}

if (!defined('_PS_VERSION_')) {
    exit;
}

require_once(dirname(__FILE__) . '/bootstrap.php');

class Simlachat extends Module
{
    const URL = 'SIMLACHAT_URL';
    const API_KEY = 'SIMLACHAT_API_KEY';
    const API_VERSION = 'SIMLACHAT_API_VERSION';
    const CONSULTANT_SCRIPT = 'SIMLACHAT_CONSULTANT_SCRIPT';

    const UPLOAD_CUSTOMERS_IDS = 'SIMLACHAT_UPLOAD_CUSTOMERS_ID';

    const LATEST_API_VERSION = '5';

    public $api = false;
    public $default_lang;
    public $apiUrl;
    public $apiKey;
    public $apiVersion;
    public $psVersion;
    public $log;
    public $confirmUninstall;

    private $use_new_hooks = true;

    public function __construct()
    {
        $this->name = 'simlachat';
        $this->tab = 'export';
        $this->version = '1.0.0';
        $this->author = 'Retail Driver LCC';
        $this->displayName = $this->l('SimlaChat');
        $this->description = $this->l('Integration module for SimlaChat');
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
        $this->default_lang = (int) Configuration::get('PS_LANG_DEFAULT');
        $this->apiUrl = Configuration::get(static::URL);
        $this->apiKey = Configuration::get(static::API_KEY);
        $this->apiVersion = Configuration::get(static::API_VERSION);
        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
        $this->psVersion = Tools::substr(_PS_VERSION_, 0, 3);
        $this->log = SimlachatUtils::getLogDir();
        $this->module_key = '149c765c6cddcf35e1f13ea6c71e9fa5';

        if ($this->psVersion == '1.6') {
            $this->bootstrap = true;
            $this->use_new_hooks = false;
        }

        if ($this->apiUrl && $this->apiKey) {
            $this->api = new SimlachatProxy($this->apiUrl, $this->apiKey, $this->log, $this->apiVersion);
        }

        parent::__construct();
    }

    public function install()
    {
        return (
            parent::install() &&
            $this->registerHook('actionCustomerAccountAdd') &&
            $this->registerHook('header') &&
            ($this->use_new_hooks ? $this->registerHook('actionCustomerAccountUpdate') : true) &&
            ($this->use_new_hooks ? $this->registerHook('actionValidateCustomerAddressForm') : true)
        );
    }

    public function hookHeader()
    {
        $result = '';

        $consultant = new SimlachatConsultant();

        if ($consultant->getJs()) {
            $result .= $consultant->getJs();
        }

        return $result;
    }

    public function uninstall()
    {
        return (
            parent::uninstall() &&
            Configuration::deleteByName(static::URL) &&
            Configuration::deleteByName(static::API_KEY) &&
            Configuration::deleteByName(static::API_VERSION) &&
            Configuration::deleteByName(static::CONSULTANT_SCRIPT)
        );
    }

    public function getContent()
    {
        $output = '';
        $url = Configuration::get(static::URL);
        $apiKey = Configuration::get(static::API_KEY);
        $apiVersion = static::LATEST_API_VERSION;

        if (Tools::isSubmit('submit' . $this->name)) {
            $customersIds = (string) Tools::getValue(static::UPLOAD_CUSTOMERS_IDS);

            if (!empty($customersIds)) {
                $this->uploadCustomers(SimlachatUtils::partitionId($customersIds));
            } else {
                $output .= $this->saveSettings();
            }

            Configuration::updateValue(static::API_VERSION, $apiVersion);
        }

        if ($url && $apiKey) {
            $this->api = new SimlachatProxy($url, $apiKey, $this->log, $this->apiVersion);
        }

        $assetsBase = sprintf(
            "%s%smodules/%s/views",
            Tools::getShopDomainSsl(true, true),
            __PS_BASE_URI__,
            $this->name
        );

        $templateFactory = new SimlachatTemplateFactory($this->context->smarty, $assetsBase);

        return $templateFactory->createTemplate($this)->setErrors($output)->render(__FILE__);
    }

    public function displayUploadCustomersForm()
    {
        $default_lang = $this->default_lang;
        $fields_form = array();

        if ($this->api) {
            $fields_form[]['form'] = array(
                'legend' => array('title' => $this->l('Manual export of customers')),
                'input' => array(
                    array(
                        'type' => 'text',
                        'label' => $this->l('Customers IDs'),
                        'name' => static::UPLOAD_CUSTOMERS_IDS,
                        'required' => false
                    )
                ),
                'submit' => array(
                    'title' => $this->l('Upload'),
                    'class' => 'button'
                )
            );
        }

        $helper = new HelperForm();

        $helper->module = $this;
        $helper->name_controller = $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->currentIndex = AdminController::$currentIndex . '&configure=' . $this->name;
        $helper->id = "simlachat_upload_form";

        $helper->default_form_language = $default_lang;
        $helper->allow_employee_form_lang = $default_lang;

        $helper->title = $this->displayName;
        $helper->show_toolbar = true;
        $helper->toolbar_scroll = true;
        $helper->submit_action = 'submit' . $this->name;
        $helper->toolbar_btn = array(
            'save' =>
                array(
                    'desc' => $this->l('Save'),
                    'href' => sprintf(
                        "%s&configure=%s&save%s&token=%s",
                        AdminController::$currentIndex,
                        $this->name,
                        $this->name,
                        Tools::getAdminTokenLite('AdminModules')
                    )
                ),
            'back' => array(
                'href' => AdminController::$currentIndex . '&token=' . Tools::getAdminTokenLite('AdminModules'),
                'desc' => $this->l('Back to list')
            )
        );

        $helper->fields_value[static::UPLOAD_CUSTOMERS_IDS] = '';

        return $helper->generateForm($fields_form);
    }

    public function hookActionCustomerAccountAdd($params)
    {
        $this->api->customersCreate(
            SimlachatCustomers::buildCrmCustomer($params['newCustomer'])
        );
    }

    // this hook added in 1.7
    public function hookActionCustomerAccountUpdate($params)
    {
        /** @var Customer $customer */
        $customer = $params['customer'];

        $customerSend = SimlachatCustomers::buildCrmCustomer(
            $customer,
            SimlachatCustomers::addressParse(new Address(Address::getFirstCustomerAddressId($customer->id)))
        );

        $this->api->customersEdit($customerSend);
    }

    // this hook added in 1.7
    public function hookActionValidateCustomerAddressForm($params)
    {
        $this->hookActionCustomerAccountUpdate(
            array('customer' => new Customer($params['cart']->id_customer))
        );
    }

    /**
     * @param $ids
     *
     * @return string
     */
    private function uploadCustomers($ids)
    {
        $result = '';
        $customers = array();

        foreach ($ids as $id) {
            $customers[$id] = SimlachatCustomers::buildCrmCustomer(
                new Customer($id),
                SimlachatCustomers::addressParse(new Address(Address::getFirstCustomerAddressId($id)))
            );
        }

        SimlachatCustomers::uploadCustomers($this->api, $customers);

        if (SimlachatApiErrors::getErrors()) {
            foreach (SimlachatApiErrors::getErrors() as $error) {
                $result .= $this->displayError($error);
            }
        } else {
            $result .= $this->displayConfirmation($this->l('All customers were uploaded successfully'));
        }

        return $result;
    }

    private function validateCrmAddress($address)
    {
        if (preg_match("/https:\/\/(.*).(retailcrm|simlachat).(pro|ru|es|com)/", $address) === 1) {
            return true;
        }

        return false;
    }

    private function validateApiVersion($settings)
    {
        $api = new SimlachatProxy(
            $settings['url'],
            $settings['apiKey'],
            $this->log,
            '5'
        );

        $response = $api->apiVersions();

        if ($response !== false) {
            return true;
        }

        return false;
    }

    private function validateForm($settings, $output)
    {
        if (!$this->validateCrmAddress($settings['url']) || !Validate::isGenericName($settings['url'])) {
            $output .= $this->displayError($this->l('Invalid or empty SimlaChat address'));
        } elseif (!$settings['apiKey'] || $settings['apiKey'] == '') {
            $output .= $this->displayError($this->l('Invalid or empty SimlaChat API key'));
        } elseif (!$this->validateApiVersion($settings)) {
            $output .= $this->displayError($this->l('The selected version of the API is unavailable'));
        }

        return $output;
    }

    private function saveSettings()
    {
        $output = '';
        $url = (string) Tools::getValue(static::URL);
        $apiKey = (string) Tools::getValue(static::API_KEY);
        $consultantCode = (string) Tools::getValue(static::CONSULTANT_SCRIPT);

        if (!empty($url) && !empty($apiKey)) {
            $settings  = array(
                'url' => $url,
                'apiKey' => $apiKey
            );

            $output .= $this->validateForm($settings, $output);

            if ($output === '') {
                Configuration::updateValue(static::URL, $url);
                Configuration::updateValue(static::API_KEY, $apiKey);
            }
        }

        if (!empty($consultantCode)) {
            Configuration::updateValue(static::CONSULTANT_SCRIPT, $consultantCode, true);
        }

        return $output;
    }
}
