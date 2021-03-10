
/*SITEMAP Responsive*/
var ww = document.body.clientWidth;

$(document).ready(function() {
    $(".sitemap-nav li a").each(function() {
        if ($(this).next().length > 0) {
            $(this).addClass("parent");
        };
    })
    
    $(".toggleMenu").click(function(e) {
        e.preventDefault();
        $(this).toggleClass("active");
        $(".sitemap-nav").toggle();
    });
    adjustMenu();
})

$(window).bind('resize orientationchange', function() {
    ww = document.body.clientWidth;
    adjustMenu();
});

var adjustMenu = function() {
    if (ww < 1000) {
        /*
        $(".toggleMenu").css("display", "inline-block");
        if (!$(".toggleMenu").hasClass("active")) {
            $(".sitemap-nav").hide();
        } else {
            $(".sitemap-nav").show();
        }
        */
        $("#intronew-desktop").hide();

        $("#sitemap-desktop").hide();
        $(".sitemap-nav").show();
        $(".sitemap-nav li").unbind('mouseenter mouseleave');
        $(".sitemap-nav li a.parent").unbind('click').bind('click', function(e) {
            // must be attached to anchor element to prevent bubbling
            console.log(".sitemap-nav li a.parent");
            e.preventDefault();
            $(this).parent("li").toggleClass("hover");
        });

        $(".sitemap-nav li li a.parent").unbind('click').bind('click', function(e) {
            console.log(".sitemap-nav li li a.parent");
            // must be attached to anchor element to prevent bubbling
            e.preventDefault();
            $(this).parent("li").toggleClass("hover");
        });
    } 
    else if (ww >= 1000) {
        $("#intronew-desktop").show();
        $("#intronew-mobile").hide();

        $("#sitemap-desktop").show();
        $("#sitemap-mobile").hide();

        $(".toggleMenu").css("display", "none");
        $(".sitemap-nav").show();
        $(".sitemap-nav li").removeClass("hover");
        $(".sitemap-nav li a").unbind('click');
        $(".sitemap-nav li").unbind('mouseenter mouseleave').bind('mouseenter mouseleave', function() {
            // must be attached to li so that mouseleave is not triggered when hover over submenu
            $(this).toggleClass('hover');
        });
    }
}

function openPage(pageName,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        /*tablinks[i].style.backgroundColor = "";*/
        tablinks[i].style.color = "";
        tablinks[i].style.borderTop = "none";
    }
    document.getElementById(pageName).style.display = "block";
    /*elmnt.style.backgroundColor = color;*/
    elmnt.style.color = "orange";
    elmnt.style.borderTop = "solid 1px orange";
    //elmnt.classList.add("tabactive");

}

/*---------------------------- Home page ---------------------*/
$(document).ready(function () {
    if($( "#vincity-tab" ).length) {
        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
        $('.outside-a').mouseenter(
                 function () {
                   $('.outside-icon', this).css('background-image','url(https://media.vinhomes.vn/storage/selected.png)');
                 });

         $('.outside-a').mouseleave(       
                function () {
                   $('.outside-icon', this).css('background-image','url(https://media.vinhomes.vn/storage/unselected.png)');
                });

    }

    if($( "#featured-media" ).length) {
        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
        
        var player;
        var $featuredMedia = $( "#featured-media" ); // 1. The Video Container.
        var $featuredVideo = $( "#featured-video" ); // 2. The Youtube Video.

        //function onYouTubeIframeAPIReady() {
        window.onYouTubeIframeAPIReady = function() {
           player = new YT.Player("featured-video", {
            events: {
              'onStateChange': onPlayerStateChange
            }
          });
        }
        /**
         * Run when the Youtube video state (play, pause, etc.) is changed.
         *
         * @param {Object} event The Youtube Object Event.
         * @return {Void}
         */
        function onPlayerStateChange( event ) {
           
           var isPlay  = 1 === event.data;
           var isPause = 2 === event.data;
           var isEnd   = 0 === event.data;

           if ( isPlay ) {
              $featuredVideo.removeClass( "is-paused" );
              $featuredVideo.toggleClass( "is-playing" );
           }
         
           if ( isPause ) {
              $featuredVideo.removeClass( "is-playing" );
              $featuredVideo.toggleClass( "is-paused" );
           }
         
           if ( isEnd ) {
              $featuredVideo.removeClass( "is-playing", "is-paused" );
           }

        }

        var $window = $( window ); // 1. Window Object.
        var top = $featuredMedia.offset().top; // 4. The video position from the top of the document;
        var offset = Math.floor( top + ( $featuredMedia.outerHeight() / 2 ) ); //5. offset.
        var offset_up = Math.floor( top - ( $featuredMedia.outerHeight() ) ); //5. offset.

        $window
        .on( "resize", function() {
           top = $featuredMedia.offset().top;
           offset = Math.floor( top + ( $featuredMedia.outerHeight() / 2 ) );
        } )
        .on( "scroll", function() {
           top = $featuredMedia.offset().top;
           offset = Math.floor( top + ( $featuredMedia.outerHeight() / 2 ) );
           if($( window ).width() > 1000) {
                $featuredVideo.toggleClass( "is-sticky",
                 ( ($window.scrollTop() > offset) || ($window.scrollTop() < offset_up) ) && $featuredVideo.hasClass( "is-playing" )
               );
           }
        } );

        /*
        && $featuredVideo.hasClass( "is-playing" )
        var ha = ( $('#videoBox').offset().top + $('#videoBox').height() );

        $(window).scroll(function(){

            if ( $(window).scrollTop() > ha + 500 ) {
                $('#videoBox').css('bottom','0');

            } else if ( $(window).scrollTop() < ha + 200) {

                $('#videoBox').removeClass('out').addClass('in');
            } else {

                $('#videoBox').removeClass('in').addClass('out');
                $('#videoBox').css('bottom','-500px');
          };

        });
        */
    }
    
    /*banner*/
    var height_screen = $(window).height();
    var width_screen = $(window).width();
    var height_banner = height_screen - $('.header').outerHeight();
    var owl = $('#banner .owl-carousel');
    $('.header').next().css('margin-top', $('.header').outerHeight() + 'px');
    $('#form-search').css('height', $('.header').outerHeight() + 'px');
    //Set active URL
    /*if(location.pathname.split("/")[1] != ''){
        $('.nav.navbar-nav li a[href^="/' + location.pathname.split("/")[1] + '"]').parent().addClass('active');
    }*/
    owl.owlCarousel({
        margin: 0,
        nav: true,
        loop: true,
        dots: true,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
        items: 1,
        navText: ['&larr;', '&rarr;'],
    });
    if (width_screen < 980) {
        $('#menu .navbar-nav').css('height', height_screen + 'px');
        $('#filter-mobile .modal-content').css('height', height_screen);
        //$('.banner-bds-detail img').css('height', height_screen/2);
    }
    if (width_screen < 767) {
        // $('.banner-bds-detail img').css('height', height_screen / 2);
    }
    if (width_screen > 1024) {
        //$('#banner').css('height', height_banner + 'px');
        //$('.banner-img').css('height', height_banner + 'px');
        //$('#banner .banner').css('height', height_banner + 'px');
        //$('#banner .banner .item').css('height', height_banner + 'px');

    }
    $('.menu-project ul li a').pageNav({'scroll_shift': $('.menu-project').outerHeight()});


    /*list project*/
    $(document).ready(function () {
        var owl = $('#projects .owl-carousel');
        owl.owlCarousel({
            margin: 10,
            nav: true,
            loop: true,
            dots: true,
            navText: ['&larr;', '&rarr;'],
            responsive: {
                0: {
                    items: 1
                },
                768: {
                    items: 2
                },
                1024: {
                    items: 3
                },

            }
        })
    })

    /*slder hanh phuc ngap tran*/
    var width_slider = $('.item-happy').width();
    if (width_screen > 767) {

        width_slider = $('.item-happy').width() - 30;
    }
    if (width_screen > 980) {
        width_slider = ($('.item-happy').width() * 0.58333333) - 30;
    }

    $('.happy-content .item-happy .slider-hp.owl-carousel').css('max-width', width_slider + 'px');
    $('.happy-content .item-happy  .left.slider-hp.owl-carousel').owlCarousel({
        margin: 0,
        loop: true,
        autoplay: true,
        autoplayTimeout: 3000,
        items: 1,
        animateOut: 'slideOutRight',
        animateIn: 'slideInLeft',
        touchDrag: true,
        mouseDrag: true,
    });
    $('.happy-content .item-happy  .right.slider-hp.owl-carousel').owlCarousel({
        margin: 0,
        loop: true,
        autoplay: true,
        autoplayTimeout: 3000,
        items: 1,
        animateOut: 'slideOutRight',
        animateIn: 'slideInLeft',
        touchDrag: true,
        mouseDrag: true,
    });

    $('.happy-content .item-happy .slider-hp.owl-carousel').css('max-width', width_slider + 'px');
    $('.happy-content .item-happy  .left.slider-hp.owl-carousel').owlCarousel({
        margin: 0,
        loop: true,
        autoplay: true,
        autoplayTimeout: 3000,
        items: 1,
        animateOut: 'slideOutRight',
        animateIn: 'slideInLeft',
        touchDrag: true,
        mouseDrag: true,
    });
    $('.happy-content .item-happy  .right.slider-hp.owl-carousel').owlCarousel({
        margin: 0,
        loop: true,
        autoplay: true,
        autoplayTimeout: 3000,
        items: 1,
        animateOut: 'slideOutRight',
        animateIn: 'slideInLeft',
        touchDrag: true,
        mouseDrag: true,
    });

    var width_slider_new = $('.item-happy-new').width();

    $('.happy-content-new .item-happy-new .slider-hp.owl-carousel').css('max-width', width_slider_new + 'px');
    $('.happy-content-new .item-happy-new  .left.slider-hp.owl-carousel').owlCarousel({
        margin: 0,
        loop: true,
        dots: true,
        nav: false,
        autoplay: false,
        autoplayTimeout: 3000,
        items: 1,
        animateOut: 'slideOutRight',
        animateIn: 'slideInLeft',
        touchDrag: true,
        mouseDrag: true,
    });
    $('.happy-content-new .item-happy-new  .right.slider-hp.owl-carousel').owlCarousel({
        margin: 0,
        loop: true,
        dots: true,
        nav: false,
        autoplay: true,
        autoplayTimeout: 3000,
        items: 1,
        animateOut: 'slideOutRight',
        animateIn: 'slideInLeft',
        touchDrag: true,
        mouseDrag: true,
    });

    var width_slider_tab = $('.item-tab').width();

    $('.happy-content-new .item-tab .slider-tab.owl-carousel').css('max-width', width_slider_tab + 'px');
    $('.happy-content-new .item-tab  .left.slider-tab.owl-carousel').owlCarousel({
        margin: 0,
        loop: true,
        dots: true,
        nav: false,
        autoplay: false,
        autoplayTimeout: 3000,
        items: 1,
        animateOut: 'slideOutRight',
        animateIn: 'slideInLeft',
        touchDrag: true,
        mouseDrag: true,
    });
    $('.happy-content-new .item-tab  .right.slider-tab.owl-carousel').owlCarousel({
        margin: 0,
        loop: true,
        dots: true,
        nav: false,
        autoplay: true,
        autoplayTimeout: 3000,
        items: 1,
        animateOut: 'slideOutRight',
        animateIn: 'slideInLeft',
        touchDrag: true,
        mouseDrag: true,
    });

    $('#slider-gt-new .owl-carousel').owlCarousel({
        margin: 10,
        nav: true,
        loop: true,
        center: true,
        autoplay: false,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        items: 1,
        navText: ['&larr;', '&rarr;'],
        /*
        responsive: {
            0: {
                items: 1
            },
            1000: {
                items: 2
            },

        }
        */
        onTranslated: function(me){
            $(me.target).find(".owl-item.active [data-src]:not(.loaded)").each(function(i,v){
                $(v).addClass("loaded").css("background-image", "url("+$(v).attr("data-src")+")");
            });
        }
    });
    var first_title = $('#slider-gt-new .owl-carousel .owl-item.active h3').html();
    $('#title').html(first_title);

    $('#slider-gt-mob .owl-carousel').owlCarousel({
        margin: 10,
        nav: true,
        loop: true,
        center: true,
        autoplay: false,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        items: 1,
        navText: ['&larr;', '&rarr;'],
        /*
        responsive: {
            0: {
                items: 1
            },
            1000: {
                items: 2
            },

        }
        */
        onTranslated: function(me){
            $(me.target).find(".owl-item.active [data-src]:not(.loaded)").each(function(i,v){
                $(v).addClass("loaded").css("background-image", "url("+$(v).attr("data-src")+")");
            });
        }
    });
    var first_title = $('#slider-gt-mob .owl-carousel .owl-item.active h3').html();
    $('#title').html(first_title);

    $('#khu-do-thi-hoan-thien .mob-vincity-carousel').owlCarousel({
        loop: true,
        margin:10,
        responsive:{
            0:{
                items:1
            },
            980:{
                items:1,
                center: true,
                nav: true,
                navText:['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
                margin: 0,
                stagePadding: 200
            }
            
        }
    });
        
    /*gallery*/
    go();
    window.addEventListener('resize', go);

    function go() {
        var width = document.documentElement.clientWidth;
        //document.querySelector('.height').innerText = document.documentElement.clientHeight;
        var gallery = $('#gallery .content-gallery');
        if (width <= 980) {
            //stat carousel slider
            gallery.addClass('owl-carousel');
            gallery.owlCarousel({
                margin: 10,
                nav: true,
                loop: true,
                dots: true,
                autoplay: true,
                autoplayTimeout: 3000,
                items: 1,
                navText: ['&larr;', '&rarr;'],
                responsive: {
                    0: {
                        items: 1
                    },


                }
            });
        }
        else {
            //turn off carousel slider
            gallery.trigger('destroy.owl.carousel');
            gallery.addClass('off');
        }
    }

    //mobile menu
    //var html_before = $('.footer .social').html();
    if (width_screen < 768) {
        //social
        $('.social').appendTo('.social-mobile');
        $('.social .facebook a').html('<i class="fa fa-facebook" aria-hidden="true"></i>');
        $('.social .youtube a').html('<i class="fa fa-youtube" aria-hidden="true"></i>');
        $('.social .instagram a').html('<i class="fa fa-instagram" aria-hidden="true"></i>');

        //hotline
        $('.hotline').appendTo('.hotline-mobile');

        //Infor social
        $('.list-info-job').prependTo('.left-content');

        //bai viet lien quan
        $('.related-post').prependTo('.mobile-related');

        /*//bat đong sản nhà ở chi tiết
        $('#gioi-thieu .content-chi-tiet').appendTo('#collapse1');
        $('#tieu-khu .content-chi-tiet').appendTo('#collapse2');
        $('#tien-ich .content-chi-tiet').appendTo('#collapse3');*/

        //link du an
        $('.banner-bds-detail .bottom-banner .pull-right a').appendTo('.banner-bds-detail .bottom-banner .pull-left');


        //height menu
        $('.main-menu').css('height', (height_screen - 72));
    }
    else {
        //$('top-footer .social').html(html_before);
        $('.social .facebook a').html('Facebook');
        $('.social .youtube a').html('Youtube');
        $('.social .instagram a').html('Instagram');

    }

    /*show scroll btn*/
    $(window).scroll(function () {
        if ($(this).scrollTop() > 500) {
            $('#go-to-top').fadeIn(500);

        } else {
            $('#go-to-top').fadeOut(500);
        }
    });

    // Animate the scroll to top
    $('#go-to-top').click(function (event) {
        event.preventDefault();
        $('.header').fadeIn();
        $('html, body').animate({scrollTop: 0}, 1500);
    });

    /*fixed menu*/


    /************************************Scroll event**********************************/

        // Hide Header on on scroll down
    var didScroll;
    var lastScrollTop = 0;
    var delta = 0;
    var navbarHeight = $('.header').outerHeight();

    $(window).scroll(function (event) {
        didScroll = true;
    });

    //In page BDS detail
    if ($('#bat-dong-san-ban .menu-project').length || ($('#khu-do-thi-hoan-thien .menu-project').length > 0 && $(window).width() > 767)) {
        var offset_top = $('.header-content').outerHeight() + $('.header').outerHeight();
        $(window).bind('scroll', function () {
            //If mouse
            if ($(window).scrollTop() > offset_top) {
                $('.header').css('transform', 'translateY(-100%)');
                $('.menu-project').addClass('fixed');
            } else {
                setInterval(function () {
                    if (didScroll) {
                        hasScrolled();
                        didScroll = false;
                    }
                }, 250);
                //$('.header').css('transform','none');
                $('.menu-project').removeClass('fixed');
            }
        });
        //Share in news mobile
    } else if ($(window).width() < 980 && $('h1.title-ttdt').length) {
        var offset_title = $('.header').outerHeight() + $('h1.title-ttdt').outerHeight();
        $('.list-social').prependTo($('.menu-mobile').parent());
        $('#list-share .modal-dialog .modal-content').css('height', $(window).height());
        $(window).bind('scroll', function () {
            if ($(window).scrollTop() > 0) {
                if ($(window).scrollTop() > offset_title) {
                    $('.list-social').show();
                    $('.header .logo').hide();
                    $('.language-search').hide();
                } else {
                    $('.list-social').hide();
                    $('.header .logo').show();
                    $('.language-search').show();
                }
            } else {
                $('.list-social').hide();
                $('.header .logo').show();
                $('.language-search').show();
            }
        });
    } else {
        setInterval(function () {
            if (didScroll) {
                hasScrolled();
                didScroll = false;
            }
        }, 250);
    }


    function hasScrolled() {
        var st = $(this).scrollTop();

        // Make sure they scroll more than delta
        if (Math.abs(lastScrollTop - st) <= delta)
            return;
        if (st > lastScrollTop && st > navbarHeight) {
            // Scroll Down
            $('.header').css('transform', 'translateY(-100%)');
        } else {
            // Scroll Up
            if ($('.menu-project').length) {
                var offset_top = $('.header-content').outerHeight() + $('.header').outerHeight();
                if ($(window).scrollTop() < offset_top) {
                    $('.header').css('transform', 'none');
                }
            } else if (st + $(window).height() < $(document).height()) {
                $('.header').css('transform', 'none');
            }
        }
        lastScrollTop = st;
    }

    /*Check mobile*/
    if ($(window).width() < 768) {
        $('#tuyen-dung-chi-tiet .after-content-job .nop-cv').appendTo('#tuyen-dung-chi-tiet .nop-cv-fixed');
        $(window).bind('scroll', function () {
            //nop cv fixed
            if ($('#tuyen-dung-chi-tiet .content-job').length > 0 && $(window).scrollTop() > $('#tuyen-dung-chi-tiet .content-job').offset().top && $(window).scrollTop() < $('.left-content .after-content-job').offset().top) {
                $('#tuyen-dung-chi-tiet .nop-cv-fixed').removeClass('fadeOutDown');
                $('#tuyen-dung-chi-tiet .nop-cv-fixed').addClass('fadeInUp');
            } else {
                $('#tuyen-dung-chi-tiet .nop-cv-fixed').removeClass('fadeInUp');
                $('#tuyen-dung-chi-tiet .nop-cv-fixed').addClass('fadeOutDown');
            }

            //arrow slider bds ban chi tiet
            var height_img = $('.list-tieu-khu .item img').height();
            $('.list-tieu-khu .owl-next, .list-tieu-khu .owl-prev').css('top', height_img / 2 + 'px');
        });

    }

    /*var mousewheelevt = (/Firefox/i.test(navigator.userAgent)) ? "DOMMouseScroll" : "mousewheel" //FF doesn't recognize mousewheel as of FF3.x
    $('body').bind(mousewheelevt, function(e){
        var evt = window.event || e //equalize event object
        evt = evt.originalEvent ? evt.originalEvent : evt; //convert to originalEvent if possible
        var delta = evt.detail ? evt.detail*(-40) : evt.wheelDelta //check for detail first, because it is used by Opera and FF

        if(delta > 0) {
            //scroll up
            $('.header').show();
        }
        else{
            //scroll down
            $('.header').fadeOut(800);
        }
    });*/


    /*********************************Selected giới thiệu*******************************/
    $('.slbProject').change(function () {
        $(this).parent().parent().find('[id^=contact_]').hide();
        $('#' + $(this).val()).show();
    });

    //animation form
    var submitIcon = $('#btn-search');
    var inputBox = $('.searchbox-input');
    var searchBox = $('.searchbox');
    var searchForm = $('#form-search');
    var closeForm = $('#btn-close');
    submitIcon.click(function () {
        searchBox.addClass('searchbox-open');
        searchForm.addClass('open');
        inputBox.focus();
        isOpen = true;
    });
    closeForm.click(function () {
        searchBox.removeClass('searchbox-open');
        searchForm.removeClass('open');
        inputBox.focusout();
    });
    submitIcon.mouseup(function () {
        return false;
    });
    searchBox.mouseup(function () {
        return false;
    });


    /*slider gioi thieu*/

    $('#slider-gt .owl-carousel').owlCarousel({
        margin: 10,
        nav: true,
        loop: true,
        center: true,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        items: 2,
        navText: ['&larr;', '&rarr;'],
        responsive: {
            0: {
                items: 1
            },
            1000: {
                items: 2
            },

        }
    });
    var first_title = $('#slider-gt .owl-carousel .owl-item.active h3').html();
    $('#title').html(first_title);

    /*Slider tiểu khu*/
    var owl_tieu_khu = $('.tieu-khu .owl-carousel');
    owl_tieu_khu.owlCarousel({
        margin: 0,
        nav: true,
        loop: true,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        items: 1,
        navText: ['&larr;', '&rarr;'],
    });

    //fixed menu khi scrool

    var num = $('.header').offset().top;	//number of pixels before modifying styles

    /**
     * paralax
     */
    $('.parallax-mirror').css('transform', 'translateY(76px)');
});

function buttonUp() {
    var inputVal = $('.searchbox-input').val();
    inputVal = $.trim(inputVal).length;
    if (inputVal !== 0) {
        $('.searchbox-icon').css('display', 'none');
    } else {
        $('.searchbox-input').val('');
        $('.searchbox-icon').css('display', 'block');
    }
};


//js scroll down
// Select all links with hashes
$('#scroll-down a')
// Remove links that don't actually link to anything

    .click(function (event) {
        // On-page links
        if (
            location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
            &&
            location.hostname == this.hostname
        ) {
            // Figure out element to scroll to
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            // Does a scroll target exist?
            if (target.length) {
                // Only prevent default if animation is actually gonna happen
                event.preventDefault();
                $('html, body').animate({
                    scrollTop: target.offset().top - 90
                }, 1000, function () {
                    // Callback after animation
                    // Must change focus!
                    var $target = $(target);
                    $target.focus();
                    if ($target.is(":focus")) { // Checking if the target was focused
                        return false;
                    } else {
                        $target.attr('tabindex', '-1'); // Adding tabindex for elements not focusable
                        $target.focus(); // Set focus again
                    }
                    ;
                });
            }
        }
    });

//filter location
$('ul#location li a').click(function () {
    var filter = $(this).attr('id');
    filterList(filter);
});


//News filter function
function filterList(value) {
    var list = $("#list-project .project");
    $(list).fadeOut("fast");
    if (value == "All") {
        $("#list-project").find(".project").each(function (i) {
            $(this).delay(200).slideDown("fast");
        });
    } else {
        //Notice this *=" <- This means that if the data-category contains multiple options, it will find them
        //Ex: data-category="Cat1, Cat2"
        $("#list-project").find(".project[data-category*=" + value + "]").each(function (i) {
            $(this).delay(200).slideDown("fast");
        });
    }
}

// Youtube
// function youtube_parser(url){
//     var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
//     var match = url.match(regExp);
//     return (match&&match[7].length==11)? match[7] : false;
// }

// var youtube = document.querySelectorAll( ".youtube-ifr" );

// for (var i = 0; i < youtube.length; i++) {

//     //var source = "https://img.youtube.com/vi/"+ youtube[i].dataset.embed +"/hqdefault.jpg";
//     var source = window.location.pathname+'dizi/themes/vinhome/assets/images/bg-video.jpg';

//     var image = new Image();
//     image.src = source;
//     image.addEventListener( "load", function() {
//         youtube[ i ].appendChild( image );
//     }( i ) );

//     youtube[i].addEventListener( "click", function() {

//         var iframe = document.createElement( "iframe" );
//         iframe.setAttribute( "frameborder", "0" );
//         iframe.setAttribute( "allowfullscreen", "" );
//         iframe.setAttribute( "src", "https://www.youtube.com/embed/"+ youtube_parser(this.dataset.embed) +"?rel=0&showinfo=0&autoplay=1" );

//         this.innerHTML = "";
//         this.appendChild( iframe );
//     } );
// };

/***********************Event modal video***************************/
var src = $('#modalVideo').find('iframe').attr('src');

//Show modal
$('#modalVideo').on('shown.bs.modal', function (e) {
    //Play video
    e.preventDefault();
    // change the src value of the video
    $('#modalVideo').find('iframe').attr('src', src + '?rel=0&autoplay=1');
});
//Close modal
$('#modalVideo').on('hidden.bs.modal', function (e) {
    //Stop video
    e.preventDefault();
    $('#modalVideo').find('iframe').attr('src', '');
});

/***************************Search typing***************************/
var TxtType = function (el, toRotate, period) {
    this.toRotate = toRotate;
    this.el = el;
    this.loopNum = 0;
    this.period = parseInt(period, 10) || 2000;
    this.txt = '';
    this.tick();
    this.isDeleting = false;
};

TxtType.prototype.tick = function () {
    var i = this.loopNum % this.toRotate.length;
    var fullTxt = this.toRotate[i];

    if (this.isDeleting) {
        this.txt = fullTxt.substring(0, this.txt.length - 1);
    } else {
        this.txt = fullTxt.substring(0, this.txt.length + 1);
    }

    this.el.placeholder = this.txt + '|';

    var that = this;
    var delta = 150 - Math.random() * 100;

    if (this.isDeleting) {
        delta /= 2;
    }

    if (!this.isDeleting && this.txt === fullTxt) {
        delta = this.period;
        this.isDeleting = true;
    } else if (this.isDeleting && this.txt === '') {
        this.isDeleting = false;
        this.loopNum++;
        delta = 500;
    }

    setTimeout(function () {
        that.tick();
    }, delta);
};

window.onload = function () {
    var elements = document.getElementsByClassName('typewrite');

    $('input.typewrite').focus(function () {
        $(this).val(' ');
    }).blur(function () {
        $(this).val('');
    });

    for (var i = 0; i < elements.length; i++) {
        var toRotate = elements[i].getAttribute('data-type');
        var period = elements[i].getAttribute('data-period');
        if (toRotate) {
            new TxtType(elements[i], JSON.parse(toRotate), period);
        }
    }

    // INJECT CSS
    var css = document.createElement("style");
    css.type = "text/css";
    css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
    document.body.appendChild(css);
};


/***************************End search typing***************************/


/*************************** Validate contact form ***************************/
$(function () {

    var langTrans = window.langTrans;

    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form[name='newsletter']").submit(function (event) {

        event.preventDefault();
        var email = $("form[name='newsletter'] input[name='email']").val();

        if (email == '') {
            Notify((typeof langTrans !== 'undefined') ? langTrans.email_required : '');
        } else {
            var regex = new RegExp(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/);
            if (!regex.test(email)) {
                Notify((typeof langTrans !== 'undefined') ? langTrans.email_invalid : '');
            } else {

                // Loading btn
                $('#filterData').button('loading');

                $.ajax({
                    type: "POST",
                    url: window.lang + '/api/form',
                    data: $(this).serialize(),
                    success: function (response) {
                        if (response.status == -1) {
                            Notify(response.errors);
                        } else {
                            Notify(response.msg);
                            $("form[name='newsletter']")[0].reset();
                        }

                        // Enable btn
                        $('#filterData').button('reset');
                    }
                });
            }
        }
    });

    $("form[name='contact']").validate({
        // Specify validation rules
        rules: {
            full_name: "required",
            email: {
                required: true,
                regexEmail: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
            },
            phone_number: {
                required: true,
                maxlength: 11
            },
            content: "required"
        },
        // Specify validation error messages
        messages: {
            full_name: (typeof langTrans !== 'undefined') ? langTrans.name_required : '',
            email: {
                required: (typeof langTrans !== 'undefined') ? langTrans.email_required : '',
                regexEmail: (typeof langTrans !== 'undefined') ? langTrans.email_invalid : ''
            },
            phone_number: {
                required: (typeof langTrans !== 'undefined') ? langTrans.phone_required : '',
                maxlength: (typeof langTrans !== 'undefined') ? langTrans.phone_invalid : ''
            },
            content: (typeof langTrans !== 'undefined') ? langTrans.message_required : ''
        },

        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function (form, event) {

            event.preventDefault();

            // Validate captcha
            var response = grecaptcha.getResponse();

            // Recaptcha failed validation
            if (response.length == 0) {
                Notify(langTrans.captcha_required);
                return;
            }

            // Loading btn
            $('.filterData').button('loading');

            $.ajax({
                type: "POST",
                url: window.lang + '/api/form',
                data: $("form[name='contact']").serialize(),
                success: function (result) {

                    if (result.status == -1) {
                        alert(result.errors);
                    } else {
                        if (window.lang == '/en') {
                            window.location.href = '/en/contact-success';
                        } else {
                            window.location.href = '/lien-he-thanh-cong';
                        }
                    }

                    // Enable btn
                    $('.filterData').button('reset');
                }
            });
        }
    });

    $.validator.addMethod(
        "regexEmail",
        function (value, element, regexp) {
            var check = false;
            return this.optional(element) || regexp.test(value);
        },
        "Please check your input."
    );

    $(document).ready(function () {
        $("#phone_number").keydown(function (event) {
            var keycode = event.which;
            if (!(event.shiftKey == false && (keycode == 46 || keycode == 8 || keycode == 37 || keycode == 39 || (keycode >= 48 && keycode <= 57)))) {
                event.preventDefault();
            }
        })
    })
});
/*************************** End validate contact form ***************************/
/***************************** URL to ID*******************************************/
$(window).on("load", function () {
    var urlHash = window.location.href.split("#")[1];
    if (urlHash && $('#' + urlHash).length) {
        $('html,body').animate({
            scrollTop: $('#' + urlHash).offset().top
        }, 500);
    }
});
/*Change LANG*/

$(document).ready(function () {
    $('#language').change(function () {
        url = $(this).find('option:checked').data('url');
        window.location.href = url;
        lang = $(this).find('option:checked').val();
        if (lang == 'vi'){
            $('#google_translate_element').css('display', 'none');
        }else{
            $('#google_translate_element').css('display', 'block');
        }
    });
});

/* Quan hệ cổ đông */
$(document).ready(function () {
    $('#quan-he-co-dong .co-dong-item .co-dong-item-link .down-load').click(function () {
        var ele = $(this).parent('.co-dong-item-link').find('ul');
        if(ele.hasClass('open')){
            ele.removeClass('open');
        } else {
            ele.addClass('open');
        }
    });
});

// Set language
window.pathName = window.location.pathname;
var strTmp = window.location.pathname.split('/');
if (typeof strTmp[1] !== 'undefined') {
    if (strTmp[1] == 'en') {
        window.lang = '/' + strTmp[1];
    } else {
        window.lang = '';
    }
} else {
    window.lang = '';
}

/*************************** Owl.carousel ***************************/
$('#gal-slide').owlCarousel({
    loop:true,
    margin:10,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
    }
});

var x = $(window).width();
var y = $('.row').width();
var z =  (x - y)/2;
$('.intro-1 row').css('margin-left', -z + 'px');

/*************************** End Owl.carousel ***************************/

if ( $(window).width() < 768 ) {
    $('.lr-content').prependTo('.life-right');
}

/* thong-tin-dau-tu-post */
if($('#thong-tin-dau-tu-post .community-carousel .item').length >= 3){
    var loop = true;
} else {
    var loop = false;
}

var $mycarouselpost = $('#thong-tin-dau-tu-post .community-carousel');
function fixOwlCarouselPost(){
    var stage = $mycarouselpost.find('.owl-stage');
    var mylen = stage.find(".item").length;
    var myleft = stage.position().left;
    if(mylen>1) {
        if(mylen == 2) {
            if(myleft > 100) {
                var mytrans = myleft - 80;

                stage.css({"transform": "translate3d(" + mytrans + "px, 0px, 0px)"});
            }
        } 
        /*else if(mylen == 3) {
            if(myleft > 200) {
                var mytrans = myleft/2;

                stage.css({"transform": "translate3d(" + mytrans + "px, 0px, 0px)"});
            }
        }
        */
    }
        
}

$mycarouselpost.owlCarousel({
    loop:false,
    hidden: false,
    touchDrag  : true,
    mouseDrag  : true,
    margin:10,
    dots: false,
    center: true,
    autoWidth:true,
    items:4,
    responsive:{
        0:{
            items:1
        },
        768:{
            loop:false,
            items:2
        },
        980:{
            loop:loop,
            items:4
        }
    },
    onRefreshed: fixOwlCarouselPost
});

/* Khu do thi hoan thien */
$('#khu-do-thi-hoan-thien .utility-carousel').owlCarousel({
    loop: true,
    margin:10,
    responsive:{
        0:{
            items:1
        },
        980:{
            items:1,
            center: true,
            nav: true,
            navText:['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
            margin: 0,
            stagePadding: 200
        }
        
    }
});

$('#khu-do-thi-hoan-thien .apartment-carousel').owlCarousel({
    loop:true,
    margin:10,
    responsive:{
        0:{
            items:1
        },
        1000:{
            items:5
        }
    }
});

if($('#khu-do-thi-hoan-thien .community-carousel .item').length >= 4){
    var loop = true;
} else {
    var loop = false;
}

var $mycarousel = $('#khu-do-thi-hoan-thien .community-carousel');
function fixOwlCarousel(){
    var stage = $mycarousel.find('.owl-stage');
    var mylen = stage.find(".item").length;
    var myleft = stage.position().left;
    if(mylen>1) {
        //stage.width(stage.width() * 2);
        //stage.css({"transform": "translate3d(250px, 0px, 0px)"});,

        if(mylen == 2) {
            if(myleft > 200) {
                var mytrans = myleft - 100;

                stage.css({"transform": "translate3d(" + mytrans + "px, 0px, 0px)"});
            }
        } else if(mylen == 3) {
            if(myleft > 200) {
                var mytrans = myleft/2;

                stage.css({"transform": "translate3d(" + mytrans + "px, 0px, 0px)"});
            }
        }
    }
        
}

$mycarousel.owlCarousel({
    loop:false,
    hidden: false,
    touchDrag  : true,
    mouseDrag  : true,
    margin:10,
    dots: false,
    center: true,
    autoWidth:true,
    items:4,
    responsive:{
        0:{
            items:1
        },
        768:{
            loop:false,
            items:2
        },
        980:{
            loop:loop,
            items:4
        }
    },
    onRefreshed: fixOwlCarousel
});

// Show loading
var optionsHoldOn = {
    theme: "sk-bounce",
    message: '',
    backgroundColor: "#000",
    textColor: "white"
};

$(document).on('click', '#khu-do-thi-hoan-thien .community-carousel .owl-item .item, #khu-do-thi-hoan-thien .apartment-tb-item, #thong-tin-dau-tu-post .community-carousel .owl-item .item', function() {
    
    if (typeof $('#lightgallery').data('lightGallery') != 'undefined') {
        $('#lightgallery').data('lightGallery').destroy(true);
        HoldOn.open(optionsHoldOn);
    }

    if ($(this).data('images').length > 0) {
        var html = '';
        $.each($(this).data('images'), function(key, value) {
            html += '<li class="" data-src="' + value.url + '" data-sub-html="' + value.title + '" >';
            html += '<img src="' + value.url + '">';
            html += '</li>';
        });

        setTimeout(function() {
            $('#lightgallery').html(html);
            setTimeout(function() {
                var lightGallery = $('#lightgallery').lightGallery();
                $('#lightgallery li:first-child').trigger('click');
                lightGallery.on('onCloseAfter.lg',function(event, index, fromTouch, fromThumb) { 
                    HoldOn.close();
                }); 
            });
        });
    }
});

var old_item = 0;
function counter(event) {

    var element   = event.target;         // DOM element, in this example .owl-carousel
    var items     = event.item.count;     // Number of items
    var item      = old_item + 1;// Position of the current item
    old_item = item;
    if(item == items){
        old_item = 0;
    }

    $('#counter-slide').html(item+"/"+items);
}

if($(window).width() < 767){
    $('#khu-do-thi-hoan-thien .menu-project').appendTo('#top-menu');
    $('#khu-do-thi-hoan-thien .menu-project').attr('id', 'menu-project-mobile');
    $('#khu-do-thi-hoan-thien .menu-project').addClass('collapse');
    $('#menu-project-mobile li a').click(function () {
        $('#menu-project-mobile').removeClass('in');
        $('#top-menu>a').attr('aria-expanded', 'false');
    });
}

$(document).ready(function ()
{
    if ($('#top-menu').length > 0) {
        var num = $('#top-menu').offset().top;//number of pixels before modifying styles
        $(window).bind('scroll', function () {
            if ($(window).scrollTop() > num) {
                $('.header.fixed').css('opacity', 0);
                $('#top-menu').addClass('fixed');
            } else {
                $('.header.fixed').css('opacity', 1);
                $('#top-menu').removeClass('fixed');
            }
        });

        $('#khu-do-thi-hoan-thien .menu-project ul li a').pageNav({'scroll_shift': ($('#khu-do-thi-hoan-thien .menu-project').outerHeight())});
    }
});

$(document).ready(function(){
    $('.apartment-tb').lightGallery();
});

$('.slbProject1').change(function() {
    window.location.href = $(this).val();
})



