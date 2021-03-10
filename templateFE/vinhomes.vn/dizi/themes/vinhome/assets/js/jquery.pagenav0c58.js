/*!
 * jQuery.pagenav
 * Copyright (c) 2015 Oleg Vysotskyi - olegblud@gmail.com | http://olegblud.com/
 * Licensed under MIT
 * http://olegblud.com/blog/pagenav
 * @projectDescription Make navigation on one-page website.
 * @author Oleg Vysotskyi
 * @version 1.0
 */







(function ($)
{
    $.fn.pageNav = function (User_Settings)
    {
        var is_chrome = navigator.userAgent.indexOf('Chrome') > -1;
        var is_safari = navigator.userAgent.indexOf("Safari") > -1;
        if ((is_chrome)&&(is_safari)) {is_safari=false;}







////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Settings
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        var $Navigation = this;

        var Settings = $.extend(
            {
                'scroll_shift': 0,
                'active_shift': 0,
                'active_item':  'active',
                'duration':     900,
                'old':0,
                'target': -1,
            }, User_Settings);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////









////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Animation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        $($Navigation).click(function ()
        {
            var top_active_click = 60;
               
            if (is_safari) {
                top_active_click= 40;
            
            }

            var Scroll = $($(this).attr('href')).offset().top - top_active_click - Settings['scroll_shift'];
            Settings['target'] = $('.menu-project ul li').index($(this).parent());

            $('html,body').animate({'scrollTop': Scroll + 'px'}, Settings['duration']);

            return false;
        });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Backlight
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        var Sizes = [];
        $Navigation.each(function (Key, Value)
        {
            Sizes[Key] = [];
            Sizes[Key]['id'] = $(Value).attr('href');
            if(Sizes[Key]['id'].indexOf("#") == 0) {
                var top_active = 200;
               
                if (is_safari) {
                    top_active = 100;
                }
                Sizes[Key]['value'] = $(Sizes[Key]['id']).offset().top - top_active - Settings['scroll_shift'] - Settings['active_shift'];
                Sizes[Key]['height'] = Sizes[Key]['value'] + $(Sizes[Key]['id']).outerHeight();
            }
        });

        $(window).scroll(function ()
        {
            var Scroll = $(window).scrollTop();
            for (var I = 0; I < Sizes.length; I++)
            {
                if ((Scroll >= Sizes[I]['value'] && Scroll <= Sizes[I]['height']))
                {
                    $Navigation.removeClass(Settings['active_item']);
                    $('[href="' + Sizes[I]['id'] + '"]').addClass(Settings['active_item']);
                    var left = I * 100;
                    //var scroll = left - scrool_left;
                    if($(window).width() < 980 && I != Settings['old']  ){
                        if(Settings['target'] != -1 && Settings['target'] != I){
                            // console.log('target: '+ Settings['target']);
                            return 1;
                        }
                        // console.log('scroll: '+left);

                        Settings['old'] = I;
                        Settings['target'] = -1;
                        // console.log('target2: '+ Settings['target']);
                        $('.menu-project').animate({scrollLeft: left + 'px'}, 500);
                    }

                }
            }
        });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    };
})(jQuery);