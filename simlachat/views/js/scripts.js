/**
 * @author Retail Driver LCC
 * @copyright RetailCRM
 * @license GPL
 * @version 1.0.0
 * @link https://simlachat.com
 *
 */

$(function(){
    var Main = {
        init: function() {
            this.tabs.init();
            this.popup.init();
            this.toggleBox();
        },
        tabs: {
            init: function () {
                $('.simla-tabs__btn').on('click', this.swithTab);
            },
            swithTab: function (e) {
                e.preventDefault();

                var id = $(this).attr('href');
                $('.simla-tabs__btn_active').removeClass('simla-tabs__btn_active');
                $(".simla-tabs__item_active").removeClass('simla-tabs__item_active')
                    .fadeOut(150, function () {
                        $(id).addClass("simla-tabs__item_active")
                            .fadeIn(150);
                    });
                $(this).addClass('simla-tabs__btn_active');
            }
        },
        popup: {
            init: function () {
                var _this = this;

                $('[data-popup]').on('click', function (e) {
                    var id = $(this).data('popup');
                    _this.open($(id));
                });
                $('.simla-popup-wrap').on('click', function (e) {
                    if (!$(e.target).hasClass('js-popup-close')) {
                        return;
                    }
                    var $popup = $(this).find('.simla-popup');
                    _this.close($popup);
                });
            },
            open: function (popup) {
                if (!popup) {
                    return;
                }
                var $wrap = popup.closest('.simla-popup-wrap');

                $wrap.fadeIn(200);
                popup.addClass('open');
                player.playVideo();
            },
            close: function (popup) {
                var $wrap = popup.closest('.simla-popup-wrap');
                popup.removeClass('open');
                $wrap.fadeOut(200);
                player.stopVideo();
            }
        },
        toggleBox: function () {
            $('.toggle-btn').on('click', function (e) {
                e.preventDefault();

                var id = $(this).attr('href');
                var $box = $(id);
                var $hideBox = $(this).closest('.simla-btns');

                $hideBox.addClass('simla-btns_hide').slideUp(100);
                $box.slideDown(100);
            })
        }
    };

    Main.init();
});


var player;
function onYouTubeIframeAPIReady() {
    player = new YT.Player('player', {
        height: '100%',
        width: '100%',
        videoId: '8X1XVtC4wL4',
    });
}
