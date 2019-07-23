{*
 * @author Retail Driver LCC
 * @copyright RetailCRM
 * @license GPL
 * @version 1.0.0
 * @link https://simlachat.com
 *
 *}

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="{$assets}/css/styles.min.css">
<title>SimlaChat</title>
<div class="simla simla-wrap">
    <div class="simla-container simla-column">
        <aside class="simla-column__aside">
            <div class="simla-menu">
                <a href="{$current|escape:'htmlall':'UTF-8'}&amp;token={$token|escape:'htmlall':'UTF-8'}&amp;configure=simlachat" class="simla-menu__btn simla-menu__btn_big">Configuraciones</a>
                <a href="{$current|escape:'htmlall':'UTF-8'}&amp;token={$token|escape:'htmlall':'UTF-8'}&amp;configure=simlachat&item=consultant" class="simla-menu__btn simla-menu__btn_active">Consultor en línea</a>
            </div>
        </aside>
        <article class="simla-column__content">
            <h1 class="simla-title simla-title_content">SimlaChat</h1>
            <div class="simla-form simla-form_main">
                <form action="{$current|escape:'htmlall':'UTF-8'}&amp;token={$token|escape:'htmlall':'UTF-8'}&amp;configure=simlachat&item=consultant" method="post">
                    <input type="hidden" name="submitsimlachat" value="1" />
                    <div class="simla-form__title">Consultor en linea</div>
                    <div class="simla-form__row">
                        <textarea required name="{$consultantScriptName}" class="simla-form__area simla-form__area_txt" id="simla-txt-area" placeholder="Código que necesita insertar en la web">
                            {$consultantScript}
                        </textarea>
                    </div>
                    <div class="simla-form__row simla-form__row_submit">
                        <input type="submit" value="Guardar" class="btn btn_invert btn_submit">
                    </div>
                </form>
            </div>
        </article>
    </div>
</div>
{*<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>*}
{*<script>window.jQuery || document.write('<script src="./js/vendor/jquery-3.4.0.min.js"><\/script>')</script>*}
<script src="{$assets}/js/scripts.js"></script>
