{*
 * @author Retail Driver LCC
 * @copyright RetailCRM
 * @license GPL
 * @version 1.0.0
 * @link https://simlachat.com
 *
 *}

{$errors}
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="{$assets}/css/styles.min.css">
<title>SimlaChat</title>
<div class="simla simla-wrap">
    <div class="simla-container">
        <h1 class="simla-title">SimlaChat</h1>
        <div class="simla-txt simla-descript">
            Solución para convertir más oportunidades de venta a través del web-chat y Facebook Messenger, disponible 24/7, incluso cuando no estás online.
        </div>
        <div class="simla-video">
            <img src="{$assets}/img/video-bg.png" alt="" />
            <div class="simla-video__btn" data-popup="#video-popup">
                <svg width="101" height="101" viewBox="0 0 101 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M50.7188 0.46875C59.5897 0.46875 68.0575 2.8881 75.7188 7.32359C83.38 11.7591 89.4284 17.8075 93.8639 25.4688C98.2994 33.13 100.719 41.5978 100.719 50.4688C100.719 59.5413 98.2994 67.8075 93.8639 75.4688C89.4284 83.13 83.38 89.38 75.7188 93.8155C68.0575 98.251 59.5897 100.469 50.7188 100.469C41.6462 100.469 33.38 98.251 25.7188 93.8155C18.0575 89.38 11.8075 83.13 7.37198 75.4688C2.93649 67.8075 0.71875 59.5413 0.71875 50.4688C0.71875 41.5978 2.93649 33.13 7.37198 25.4688C11.8075 17.8075 18.0575 11.7591 25.7188 7.32359C33.38 2.8881 41.6462 0.46875 50.7188 0.46875ZM74.1059 55.3075C75.7188 54.501 76.5252 53.0897 76.5252 51.0736C76.5252 49.2591 75.7188 47.8478 74.1059 46.8397L38.622 25.2671C37.0091 24.4607 35.3962 24.4607 33.7833 25.2671C32.1704 26.2752 31.3639 27.6865 31.3639 29.501V71.4365C31.3639 73.4526 32.1704 74.8639 33.7833 75.6704C35.3962 76.6784 37.0091 76.6784 38.622 75.6704L74.1059 55.3075Z" fill="black"/>
                </svg>
            </div>
        </div>
        <div class="simla-btns">
            <a href="#toggle-form" class="btn btn_max toggle-btn">Tengo una cuenta en SimlaChat</a>
            <div class="simla-btns__separate">or</div>
            <a href="https://simlachat.com/signup?utm_source=prestashop&utm_medium=modul&utm_campaign=button-in-modul" target="_black" class="btn btn_max btn_invert">Obtener SimlaChat Gratis</a>
        </div>
        <div class="simla-form toggle-box" id="toggle-form">
            <form action="{$current|escape:'htmlall':'UTF-8'}&amp;token={$token|escape:'htmlall':'UTF-8'}&amp;configure=simlachat" method="post">
                <input type="hidden" name="submitsimlachat" value="1" />
                <div class="simla-form__title">Configuración de la conexión</div>
                <div class="simla-form__row">
                    <input required type="text" class="simla-form__area" placeholder="URL de SimlaChat" name="{$apiUrl}">
                </div>
                <div class="simla-form__row">
                    <input required type="text" class="simla-form__area" placeholder="Accesos API SimlaChat" name="{$apiKey}">
                </div>
                <div class="simla-form__row simla-form__row_submit">
                    <input type="submit" value="Guardar" class="btn btn_invert btn_submit">
                </div>
            </form>
        </div>
        <div class="simla-tabs">
            <div class="simla-tabs__head">
                <a href="#descript" class="simla-tabs__btn simla-tabs__btn_active">Descripción</a>
                <a href="#faq" class="simla-tabs__btn">FAQ</a>
                <a href="#contacts" class="simla-tabs__btn">Contactos</a>
            </div>
            <div class="simla-tabs__body">
                <div class="simla-tabs__item simla-tabs__item_active" id="descript" style="display: block;">
                    <p>
                        SimlaChat - Solución para captar nuevos clientes, crear más oportunidades de venta y hacer un seguimiento preciso hasta que se conviertan en clientes recurrentes a través del chat online y Facebook Messenger, disponible 24/7, incluso cuando no estás online.
                    </p>
                    <p>
                        Funcionalidades de SimlaChat:
                    </p>
                    <ul class="simla-list">
                        <li class="simla-list__item">Bot Distribuidor: asigna de manera automática los mensajes entrantes entre los agentes conectados para simplificar al máximo el tiempo de respuesta.</li>
                        <li class="simla-list__item">Notas: dentro del perfil de clientes es posible dejar comentarios sobre el cliente, para que en futuras interacciones tengamos más información que nos ayude a concretar la venta.</li>
                        <li class="simla-list__item">Tareas: ayuda a hacer un seguimiento por cada cliente creando tareas y con la ayuda de notificaciones no se te olvidará nada.</li>
                        <li class="simla-list__item">Historial de comunicación: tendrás a tu disposición siempre todo el historial de comunicación con el cliente, sin importar el canal desde donde haya escrito.</li>
                        <li class="simla-list__item">Multiagente: conecta a todo tu equipo de manera simultánea para crecer, reduciendo el tiempo de respuesta y mejorando la reputación online de tu negocio.</li>
                        <li class="simla-list__item">Analítica: sobre la dinámica de mensajes recibidos, información sobre el trabajo de tus agentes y sobre los canales de dónde proviene la mayor cantidad de mensajes, para así poder invertir en campañas de marketing en el canal correcto.</li>
                    </ul>

                    <p>
                        SimlaChat está diseñado para todos los eCommerce que busquen abrir caminos alternativos para el desarrollo de su negocio a través del chat online, Facebook Messenger y otras redes sociales.
                    </p>

                </div>
                <div class="simla-tabs__item" id="faq">
                    <div class="simla-tile">
                        <div class="simla-tile__col">
                            <div class="simla-tile__item">
                                <div class="simla-tile__title">1. ¿Hay un trial del módulo?</div>
                                <div class="simla-tile__descript">El módulo cuenta con una versión trial de 14 días en los cuales podrás trabajar con ayuda del módulo de SimlaChat.</div>
                            </div>
                            <div class="simla-tile__item">
                                <div class="simla-tile__title">¿Qué es un usuario?</div>
                                <div class="simla-tile__descript">Un usuario es la persona que trabajará con el módulo de SimlaChat es como el representante de tu negocio o tu web. Cada usuario puede crear un perfil personal y tener su propio acceso al panel de la herramienta.</div>
                            </div>
                            <div class="simla-tile__item">
                                <div class="simla-tile__title">¿En qué idiomas está disponible el módulo?</div>
                                <div class="simla-tile__descript">El módulo de SimlaChat está disponible en los siguientes idiomas:
                                    <ul class="simla-list">
                                        <li class="simla-list__item">Español</li>
                                        <li class="simla-list__item">Inglés</li>
                                        <li class="simla-list__item">Ruso</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="simla-tile__col">
                            <div class="simla-tile__item">
                                <div class="simla-tile__title">¿Cuánto tiempo dura el trial?</div>
                                <div class="simla-tile__descript">El tiempo de duración de la versión trial del módulo de SimlaChat es de 14 días.</div>
                            </div>
                            <div class="simla-tile__item">
                                <div class="simla-tile__title">¿Se paga por usuario o se paga por cuenta?</div>
                                <div class="simla-tile__descript">El pago se realiza por usuario, si se agrega a otro usuario dentro del sistema de SimlaChat se realizaría el pago por dos usuarios. Cada usuario tiene derecho a una cuenta (web-chat y redes sociales). En caso de que un usuario necesite trabajar con más de una cuenta, es necesario ponerse en contacto con el equipo de SimlaChat.</div>
                            </div>
                            <div class="simla-tile__item">
                                <div class="simla-tile__title">¿Cómo puedo realizar el pago?</div>
                                <div class="simla-tile__descript">
                                    Los métodos para realizar el pago son:
                                    <ul class="simla-list">
                                        <li class="simla-list__item">Transferencia bancaria</li>
                                        <li class="simla-list__item">Tarjeta bancaria.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="simla-tabs__item" id="contacts">
                    <div class="simla-tile">
                        <div class="simla-tile__col">
                            <div class="simla-tile__item">
                                <div class="simla-tile__title">Nuestro correo electrónico y WhatsApp</div>
                                <div class="simla-tile__descript">Escríbenos en caso de preguntas o dudas.</div>
                            </div>
                        </div>
                        <div class="simla-tile__col simla-tile__col_contacts">
                            <div class="simla-tile__item">
                                <div class="simla-tile__row">
                                    <a href="mailto:mail@simlachat.com" class="simla-tile__link">mail@simlachat.com</a>
                                </div>
                                <div class="simla-tile__row">
                                    <a href="https://wa.me/34722253423" target="_blank" class="btn btn_whatsapp">WhatsApp</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="simla-popup-wrap js-popup-close">
    <div class="simla-popup" id="video-popup">
        <div class="simla-popup__close js-popup-close"></div>
        <div id="player"></div>
    </div>
</div>
<script src="https://www.youtube.com/iframe_api"></script>
{*<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>*}
{*<script>window.jQuery || document.write('<script src="{$assets}/js/vendor/jquery-3.4.0.min.js"><\/script>')</script>*}
<script src="{$assets}/js/scripts.js"></script>
