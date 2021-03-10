$(document).ready(function () {
    //list share
    var page = 1;
    $(window).scroll(function() {
        if ($('.load-more-page-tttd').length > 0) {
        var height_load_more = $('.load-more-page-tttd').offset().top;
        if ($(window).scrollTop() > height_load_more-$(window).height()+150) {
            
                //$('.load-more-page-tttd').click(function () {
                    page++;
                    csrf = $('meta[name=csrf-token]').attr('content');
                    cat = $('.load-more-page-tttd').data('cat');
                    $.ajax({
                        type: 'POST',
                        url: window.lang + '/api/get_post',
                        data: {page: page, load_more: true, _token: csrf, category: cat},
                        beforeSend: function () {

                            $('.load-more-page-tttd').css('pointer-events', 'none');
                            $('.img-load').css('display', 'block');
                        },
                        success: function (res) {
                            if (res.view!='') {
                                $('.img-load').before(res.view);
                                
                            } else {
                                $('.load-more-page-tttd').remove();
                                $('.load-more-page-tttd').hide();
                            }
                            if (!res.load_more)
                                $('.load-more-page-tttd').css('display', 'none');
                            $('.load-more-page-tttd').css('pointer-events', 'auto');
                            $('.img-load').css('display', 'none');
                            //height_load_more = $('.load-more-page-tttd').offset().top;
                        },
                        error: function (res) {
                            console.log('error');
                        }
                    });

                //});
        }
        }
    });

    $('.load-more-page-search').click(function () {
        page++;
        csrf = $('meta[name=csrf-token]').attr('content');
        search = $(this).data('search');
        $.ajax({
            type: 'GET',
            url: ((window.lang == '/en') ? '/en/search/' : '/tim-kiem/') + search,
            data: {page: page, load_more: true},
            beforeSend: function () {

                $('.load-more-page-search').css('pointer-events', 'none');
                $('.img-load').css('display', 'block');
            },
            success: function (res) {

                if (res.view) {
                    $('.img-load').before(res.view);
                } else {
                    $('.load-more-page-search').css('display', 'none');
                }
                if (!res.load_more)
                    $('.load-more-page-search').css('display', 'none');
                $('.load-more-page-search').css('pointer-events', 'auto');
                $('.img-load').css('display', 'none');
            },
            error: function (res) {
                console.log('error');
            }
        });
    });

    $('.load-more-page-td').click(function () {

        csrf = $('meta[name=csrf-token]').attr('content');
        data = $('#form_td').serialize();
        data = data + '&_token=' + csrf;
        page = $('input[name=page_]').val();
        page++;
        $('input[name=page_]').val(page);

        console.log(page);
        $.ajax({
            type: 'POST',
            url: window.lang + '/api/tuyen-dung',
            data: data,
            beforeSend: function () {

                $('.load-more-page-td').css('pointer-events', 'none');
                $('.img-load').css('display', 'block');
            },
            success: function (res) {

                if (res.view) {
                    $('#list-job tbody').append(res.view);
                } else {
                    $('.load-more-page-td').css('display', 'none');
                }
                if (!res.load_more)
                    $('.load-more-page-td').css('display', 'none');
                $('.load-more-page-td').css('pointer-events', 'auto');

                $('.img-load').css('display', 'none');
            },
            error: function (res) {
                console.log('error');
            }
        });
    });

    // Suggest search
    setTimeout(function() {
        
        // Slug value
        function slugValue (text, slugInput) {
            
            //Đổi chữ hoa thành chữ thường
            slug = text.toLowerCase();
            
            //Đổi ký tự có dấu thành không dấu
            slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
            slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
            slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
            slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
            slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
            slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
            slug = slug.replace(/đ/gi, 'd');

            // Xóa các ký tự đặt biệt
            slug = slug.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '');

            // Đổi nhiều kí tự khoảng trắng thành 1 kí tự
            slug = slug.replace(/\s+/g, ' ');
            slug = slug.replace(/\s/gi, slugInput);

            // Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
            // Phòng trường hợp người nhập vào quá nhiều ký tự trắng
            slug = slug.replace(/\-+/gi, slugInput);
            
            // Xóa các ký tự gạch ngang ở đầu và cuối
            slug = '@' + slug + '@';
            slug = slug.replace(/\@\-|\-\@|\@/gi, '');

            // In slug ra textbox có id “slug”
            return slug;
        }

        // Contain list search
        var lstKeys = [];
        var lstValues = [];

        $('input[name=q]').autoComplete({
            source: function(term, response) {
                // Trim space
                term = term.trim();

                // If length of search text < 3
                // Return
                if (term.length < 3) return;

                // Get first three characters
                var threeFirstKeyword = slugValue(term.substring(0, 3));

                // Check key is exists in lstKeys
                if ($.inArray(threeFirstKeyword, lstKeys) == -1) {

                    // Add three first characters to lst Keys
                    lstKeys.push(threeFirstKeyword);

                    $.ajax({
                        type: 'POST',
                        url: window.lang + "/api/suggest-search",
                        data: {
                            term: threeFirstKeyword
                        },
                        success: function (resultData) {
                            
                            // Contant lst keywords result
                            $.each(resultData, function(value, key) {
                                lstValues.push(value)
                            });

                            setTimeout(function() {
                                // Get list keywords show
                                var lstShow = [];
                                $.each(lstValues, function(key, value) {
                                    if (slugValue(value).indexOf(slugValue(term)) != -1) {
                                        lstShow.push(value);
                                    }
                                });

                                setTimeout(function() {
                                    response(lstShow);
                                });
                            }, 200);
                        }
                    });
                } else {
                    setTimeout(function() {
                        // Get list keywords show
                        var lstShow = [];
                        $.each(lstValues, function(key, value) {
                            if (slugValue(value).indexOf(slugValue(term)) != -1) {
                                lstShow.push(value);
                            }
                        });

                        setTimeout(function() {
                            response(lstShow);
                        });
                    }, 200);
                }
            }
        });
    });
});

// Create cookie
function setCookie(key, value) {
    $.cookie(key, value, {path: "/", expires: 86400*30});
    $('#' + key).css('display', 'none');
}

// Get cookie
function getCookie(key) {
    return $.cookie(key);
}

setTimeout(function() {
    // Hide element if isset cookie
    if (getCookie('cookie-policy') != 'true') {
        $('#cookie-policy').css('display', 'block');
    }
    //console.log(getCookie('cookie-policy'), 'cookie-policy');
}, 500);

var Notify = function (message) {
    setTimeout(function () {
        $.notify({
            // options
            icon: 'glyphicon glyphicon-info-sign',
            title: '<span style="color: #08aba7">' + ($('input[name=lang]').val() == 'vi' ? 'Thông báo' : 'Notification') + ': <br /></span>',
            message: message,
            url: 'javascript:void(0)',
            target: '_blank'
        }, {
            // settings
            element: 'body',
            position: null,
            type: "info custom-notify",
            allow_dismiss: true,
            newest_on_top: false,
            showProgressbar: false,
            placement: {
                from: "top",
                align: "right"
            },
            offset: {
                x: 30,
                y: 10
            },
            spacing: 10,
            z_index: 1060,
            delay: 5000,
            timer: 1000,
            url_target: '_blank',
            mouse_over: null,
            animate: {
                enter: 'animated fadeInRight',
                exit: 'animated fadeOutRight'
            },
            onShow: null,
            onShown: null,
            onClose: null,
            onClosed: null,
            icon_type: 'class',
        });
    }, 500);
}

// Resize image
var app = angular.module('myApp', []);
app.controller('myCtrl', ['$scope', '$q', function ($scope, $q) {
    $scope.getImageResize = function (fileNameOrigin, width, ratio, element) {
        
        // File name
        var fileName = fileNameOrigin.split('/').pop();

        // Get file path
        var path = fileNameOrigin.replace(fileName, '');

        // Image width
        var width = checkWidth();

        // Check file exists
        isImage(path + width + fileName).then(function (data) {

            // If file exists
            if (data) {
                $('.' + element).attr('src', path + width + fileName);
            } else {
                isImage(fileNameOrigin).then(function (data) {
                    if (data) {
                        $('.' + element).attr('src', fileNameOrigin);
                    }
                });
            }
        });
    }

    function checkWidth() {

        // Window width
        var width = $(window).width();

        if (width >= 320 && width <= 767) {
            return 767 + '-';
        } else if (width > 767 && width <= 980) {
            return 980 + '-';
        } else if (width > 980 && width <= 1024) {
            return 1024 + '-';
        } else if (width > 1024 && width <= 1336) {
            return 1336 + '-';
        } else {
            return '';
        }
    }

    function isImage(src) {

        var deferred = $q.defer();

        var image = new Image();
        image.src = src;

        image.onerror = function () {
            deferred.resolve(false);
        };
        image.onload = function () {
            deferred.resolve(true);
        };
        
        return deferred.promise;
    }
}]);

/*-------------- dong y nhan tin ----------------*/
$('#dong-y').change(function (event) {
    var checkbox = event.target;
    console.log(checkbox.checked);
    if (checkbox.checked) {
        //Checkbox has been checked
        $('.smContact').removeAttr("disabled");
    } else {
        //Checkbox has been unchecked
        $('.smContact').attr("disabled", true);
    }
});