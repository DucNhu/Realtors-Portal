var app = angular.module('myApp', [])
app.controller('realController', function($scope, $timeout, $http, $q) {


    /***************************Search typing***************************/
    var TxtType = function(el, toRotate, period) {
        this.toRotate = toRotate;
        this.el = el;
        this.loopNum = 0;
        this.period = parseInt(period, 10) || 2000;
        this.txt = '';
        this.tick();
        this.isDeleting = false;
    };

    TxtType.prototype.tick = function() {
        var i = this.loopNum % this.toRotate.length;
        var fullTxt = this.toRotate[i];

        if (this.isDeleting) {
            this.txt = fullTxt.substring(0, this.txt.length - 1);
        } else {
            this.txt = fullTxt.substring(0, this.txt.length + 1);
        }

        this.el.placeholder = this.txt+'|';

        var that = this;
        var delta = 150 - Math.random() * 100;

        if (this.isDeleting) { delta /= 2; }

        if (!this.isDeleting && this.txt === fullTxt) {
            delta = this.period;
            this.isDeleting = true;
        } else if (this.isDeleting && this.txt === '') {
            this.isDeleting = false;
            this.loopNum++;
            delta = 500;
        }

        setTimeout(function() {
            that.tick();
        }, delta);
    };

    window.onload = function() {
        var elements = document.getElementsByClassName('typewrite');

        $('input.typewrite').focus(function(){
            $(this).val(' ');
        }).blur(function(){
            $(this).val('');
        });

        for (var i=0; i<elements.length; i++) {
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

    $scope.getListLocationProject = function(provinceId) {

        // Province id
        var provinceId = (provinceId != '') ? provinceId : '';

        // Province name
        var provinceName = (provinceId != '') ? $scope.provinces[provinceId] : $scope.provinces[48];

        // Get long, lat of location name
        $http({
            method: 'GET', 
            url: 'https://maps.google.com/maps/api/geocode/json?address=' + slugValue(provinceName, '+') +'&sensor=&region=VI'
        }).then(function successCallback(data) {
            if (angular.isDefined(data.data) && angular.isDefined(data.data.results) && angular.isDefined(data.data.results[0]) &&
                angular.isDefined(data.data.results[0].geometry.location)) {
                $.ajax({
                    type: 'POST',
                    url: window.lang + "/real-location-api?type=" + $scope.typeSearch,
                    data: {
                        searchOptions: $scope.searchOptions
                    },
                    success: function(resultData) { 
                        $scope.markers = resultData;

                        $timeout(function() {
                            $scope.latDefault = (provinceId != '') ? data.data.results[0].geometry.location.lat : data.data.results[0].geometry.location.lat + 0.55;
                            $scope.lngDefault = data.data.results[0].geometry.location.lng;
                            $scope.zoomDefault = (provinceId != '') ? 12 : 5;
                            $scope.initMapMarker();
                        })
                    }
                });
            }
        }, function errorCallback(response) {});
    }

    $scope.latDefault = 21.0277644;
    $scope.lngDefault = 105.83415979999995;
    $scope.zoomDefault = 12;

    // Set map marker
    $scope.initMapMarker = function () {

        var places = new google.maps.LatLng($scope.latDefault, $scope.lngDefault);
        var mapOptions = {
            zoom: $scope.zoomDefault,
            center: places
        };

        // Init map
        $scope.map = new google.maps.Map(document.getElementById('map'), mapOptions);

        $scope.lstContentMarker = [];
        $scope.infoWindows = [];
        angular.forEach($scope.markers, function(value, key) {

            var places = new google.maps.LatLng(value.latitute, value.longtitute);
            var marker = new google.maps.Marker({
                map: $scope.map,
                icon: '/dizi/themes/vinhome/assets/images/map-marker.svg',
                position: places,
            });

            var str = '<div class="col-md-12 map-detail-marker">';
            str += '<figure class="col-md-3"><img src="' + $scope.markers[key].banner + '"/></figure>';
            str += '<div class="col-md-9 content-marker-detail"><span class="title">' + $scope.markers[key].name + '</span>';
            str += '<p class="address">' + $scope.markers[key].address + '</p>';
            str += '<p class="phone">' + $scope.markers[key].phone + '</p>';
            str += '<a href="'+ $scope.markers[key].url +'" target="_blank">' + $scope.markers[key].link + '</a></div>';
            str += '</div>';
            $scope.lstContentMarker[key] = str;

            $timeout(function() {
                // create info window
                var infoWindow = new google.maps.InfoWindow({
                    content: $scope.lstContentMarker[key]
                });
                
                $scope.infoWindows.push(infoWindow);
        
                // Show info window when marker is clicked
                google.maps.event.addListener(marker, 'click', function() {
                    // Close all
                    angular.forEach($scope.infoWindows, function(vl, k) {
                        $scope.infoWindows[k].close();
                    });
                    infoWindow.open($scope.map, marker);
                });
            });
        });
    }

    $scope.typeSearch = 'searchByFilter';

    $scope.searchReal = function(keyEvent) {
        if (keyEvent == 'submit' || keyEvent.which === 13) {
            $scope.typeSearch = 'searchByName';
            $scope.filterReals();
        }
    }

    /**
     * When user change select search data reals
     * @author Thanh Tuan <tuannt@diziweb.com>
     * @return {Void} 
     */
    $scope.searchReals = function(typeChange) {
        var lang = window.lang;

        if(lang == '') {
            var arraySearch = ['dia-diem', 'loai-hinh', 'dong-san-pham', 'dien-tich', 'so-phong'];
        } else {
            var arraySearch = ['province', 'product-type', 'category', 'acreage', 'room-number'];
        }

        var arraySearchTrans = {
            'dia-diem': 'province', 
            'loai-hinh': 'product-type', 
            'dong-san-pham': 'category', 
            'dien-tich': 'acreage', 
            'so-phong': 'room-number'
        };

        $timeout(function() {
            
            // Set string search
            var strSearch = window.location.pathname.split('/');
            if (strSearch[1] == 'en') {
                strSearch = '/' + strSearch[1] + '/' + strSearch[2];
            } else {
                strSearch = '/' + strSearch[1];
            }

            console.log(strSearch, 'strSearch');

            if (lang == '/en') {
                angular.forEach(arraySearch, function(value, key) {
                    if (angular.isDefined($('#' + value).val()) && $('#' + value).val() != '') {
                        strSearch += '/' + value;
                        strSearch += '/' + slugValue($('#' + value + ' option:selected').text(), '-').replace('m²', 'm2');
                    }
                });

                $timeout(function() {
                    window.history.pushState("", "", strSearch);
                    if (!$scope.firstLoadJS) {
                        $scope.typeSearch = 'searchByFilter';
                        $scope.filterReals();
                    }
                });
            } else {
                angular.forEach(arraySearch, function(value, key) {
                    if (angular.isDefined($('#' + arraySearchTrans[value]).val()) && $('#' + arraySearchTrans[value]).val() != '') {
                        strSearch += '/' + value;
                        strSearch += '/' + slugValue($('#' + arraySearchTrans[value] + ' option:selected').text(), '-').replace('m²', 'm2');
                    }
                });

                $timeout(function() {
                    window.history.pushState("", "", strSearch);
                    if (!$scope.firstLoadJS) {
                        $scope.typeSearch = 'searchByFilter';
                        $scope.filterReals();
                    }
                }); 
            }
        })

    }

    var width_screen = $(window).width();
    var height_screen = $(window).height();

    $timeout(function() {

        $('.content').css('display', 'block');

        $scope.objectKeys = function(obj){
            return Object.values(obj);
        }

        // Page options
        $scope.pageOptions = {
            page: $scope.currentPage,
            items_per_page: $scope.itemsPerPage
        };
        
        if ($scope.searchOptions.provinceId == '' &&
            $scope.searchOptions.acreage == '' &&
            $scope.searchOptions.current_category == '' &&
            $scope.searchOptions.productType == '' &&
            $scope.searchOptions.roomNumber == '') {
            //<script language="JavaScript" src="http://www.geoplugin.net/javascript.gp" type="text/javascript"></script>
            // Get current region
            // if (angular.isDefined(geoplugin_region())) {
            //     var provinceName = geoplugin_region();
            //     angular.forEach($scope.provinces, function(value, key) {
            //         if (slugValue(value, '') == slugValue(provinceName, '')) {
            //             $scope.searchOptions.provinceId = key;
            //         }
            //     });
            // }

            // // Get current latitude
            // if (angular.isDefined(geoplugin_latitude())) {
            //     $scope.latDefault = geoplugin_latitude();
            // }

            // // Get current longtitude
            // if (angular.isDefined(geoplugin_longitude())) {
            //     $scope.lngDefault = geoplugin_longitude();
            // }

            $timeout(function() {
                $scope.searchReals('province');
            })

        }

        // List categories Name
        $scope.lstCategoriesName = '';
        angular.forEach($scope.realCategories, function(value, key) {
            if ($scope.lstCategoriesName == '') {
                $scope.lstCategoriesName = value.name;
            } else {
                $scope.lstCategoriesName += ', ' + value.name;
            }
        });

        //Initialization
        $myID = 0;
        if($scope.categoryBanner != undefined) {
            $myID = $scope.categoryBanner.id;
        }
        $scope.searchOptions.categoryID = $myID;
        $scope.searchOptions.$myProductType = [];
        $scope.searchOptions.$myAcreage = [];
        $scope.searchOptions.$myRoomNumber = [];
        $scope.searchOptions.$myProvince = [];

        $.ajax({
            type: 'POST',
            url: window.lang + "/real-api?type=getDisProductType",
            data: {
                pageOptions: $scope.pageOptions,
                searchOptions: $scope.searchOptions
            },
            success: function(resultData) {
                $scope.searchOptions.$myProductType = resultData.myProductType;
                $scope.searchOptions.$myAcreage = resultData.myAcreage;
                $scope.searchOptions.$myRoomNumber = resultData.myRoomNumber;
                $scope.searchOptions.$myProvince = resultData.myProvince;
            }
        });

        $scope.disProductType = function($name) {
            var $Rows = $scope.searchOptions.$myProductType;
            var $blnDisabled = true;
            if($Rows != undefined) {
                for(i=0;i<$Rows.length;i++) {
                    if($Rows[i]['meta_value'] !== null) {
                        var $myArray = $Rows[i]['meta_value'].split(", ");

                        if($.inArray($name, $myArray) > -1) {
                            $blnDisabled = false;
                            break;
                        }
                    }
                }
                if($Rows.length == 0) {
                    $blnDisabled = false;
                }
            } else {
                $blnDisabled = false;
            }
            
            return $blnDisabled;
        }

        $scope.disAcreage = function($name) {
            var $Rows = $scope.searchOptions.$myAcreage;
            var $blnDisabled = true;

            if($Rows != undefined) {
                for(i=0;i<$Rows.length;i++) {
                    if($Rows[i]['meta_value'] !== null) {
                        var $myArray = $Rows[i]['meta_value'].split(", ");

                        if($.inArray($name, $myArray) > -1) {
                            $blnDisabled = false;
                            break;
                        }
                    }
                }
                if($Rows.length == 0) {
                    $blnDisabled = false;
                }
            } else {
                $blnDisabled = false;
            }
            return $blnDisabled;
        }

        $scope.disRoomNumber = function($name) {
            var $Rows = $scope.searchOptions.$myRoomNumber;
            var $blnDisabled = true;

            if($Rows != undefined) {
                for(i=0;i<$Rows.length;i++) {
                    if($Rows[i]['meta_value'] !== null) {
                        var $myArray = $Rows[i]['meta_value'].split(", ");

                        if($.inArray($name, $myArray) > -1) {
                            $blnDisabled = false;
                            break;
                        }
                    }
                }
                if($Rows.length == 0) {
                    $blnDisabled = false;
                }
            } else {
                $blnDisabled = false;
            }
            return $blnDisabled;
        }

        $scope.disProvince = function($name) {
            var $Rows = $scope.searchOptions.$myProvince;
            var $blnDisabled = true;
            if($Rows != undefined) {
                for(i=0;i<$Rows.length;i++) {
                    if($Rows[i]['meta_value'] !== null) {
                        var $myArray = $Rows[i]['meta_value'].split(", ");

                        if($.inArray($name, $myArray) > -1) {
                            $blnDisabled = false;
                            break;
                        }
                    }
                }
                if($Rows.length == 0) {
                    $blnDisabled = false;
                }
            } else {
                $blnDisabled = false;
            }
            
            return $blnDisabled;
        }

        $scope.firstLoadJS = true;
        $scope.filterReals = function() {

            // Hide category
            $scope.hideContent = true;

            // Current page
            $scope.pageOptions.page = 1;

            if (!$scope.firstLoadJS) {
                // Get current category and Disable loading btn
                $('#filterData').button('loading');
            }

            // Get category selected
            delete $scope.categoryBanner;
            angular.forEach($scope.realCategories, function(value, key) {
                if ($scope.searchOptions.current_category == value.slug) {
                    $scope.categoryBanner = value;
                }
            });

            $myID = 0;
            if($scope.categoryBanner != undefined) {
                $myID = $scope.categoryBanner.id;
            }
            $scope.searchOptions.categoryID = $myID;

            $.ajax({
            type: 'POST',
            url: window.lang + "/real-api?type=getDisProductType",
            data: {
                pageOptions: $scope.pageOptions,
                searchOptions: $scope.searchOptions
            },
            success: function(resultData) {
                    $scope.searchOptions.$myProductType = resultData.myProductType;
                    $scope.searchOptions.$myAcreage = resultData.myAcreage;
                    $scope.searchOptions.$myRoomNumber = resultData.myRoomNumber;
                    $scope.searchOptions.$myProvince = resultData.myProvince;

                    $('#product-type').find("option").each(function(index,value) {
                        if($(this).val() != "") {
                            var $blnDisabled = $scope.disProductType($(this).val());
                            $(this).prop("disabled",$blnDisabled);
                        }
                    });
                    $('#acreages').find("option").each(function(index,value) {
                        if($(this).val() != "") {
                            var $blnDisabled = $scope.disAcreage($(this).val());
                            $(this).prop("disabled",$blnDisabled);
                        }
                    });
                    $('#room-number').find("option").each(function(index,value) {
                        if($(this).val() != "") {
                            var $blnDisabled = $scope.disRoomNumber($(this).val());
                            $(this).prop("disabled",$blnDisabled);
                        }
                    });
                    $('#province').find("option").each(function(index,value) {
                        if($(this).val() != "") {
                            var $blnDisabled = $scope.disProvince($(this).val());
                            $(this).prop("disabled",$blnDisabled);
                        }
                    });
                }
            });

            $scope.hideTip = false;
            if ($scope.searchOptions.current_category == "" &&
                $scope.searchOptions.acreage == "" &&
                $scope.searchOptions.provinceId == "" &&
                $scope.searchOptions.roomNumber == "" &&
                $scope.searchOptions.productType == "") {
                $scope.hideTip = true;
            }

            $.ajax({
                type: 'POST',
                url: window.lang + "/real-api?type=" + $scope.typeSearch,
                data: {
                    pageOptions: $scope.pageOptions,
                    searchOptions: $scope.searchOptions
                },
                success: function(resultData) {

                    // Show or hide btn load more
                    $scope.hideBtnMore = false;
                    if (resultData.current_page >= resultData.last_page) {
                        $scope.hideBtnMore = true;
                    }

                    $scope.pageOptions.page = $scope.pageOptions.page + 1;

                    // Set reals data
                    $scope.realEstates = resultData.data;

                    //console.log(resultData);

                    // Get real product type
                    angular.forEach($scope.realEstates, function(real, index) {
                        
                        if (angular.isDefined(real.image_feature) && real.image_feature != null) {
                            $scope.getImageResize(real.image_feature.src, 450, 4/3, 'event' + index);
                        }

                        // Get list product type
                        if (angular.isDefined(real.postMetas.vinhomes_basic_product_type_value)) {
                            var arrayProductTypes = real.postMetas.vinhomes_basic_product_type_value.split(', ');
                            real.productStr = '';
                            angular.forEach(arrayProductTypes, function(v, k) {
                                if (real.productStr == '') {
                                    if (angular.isDefined($scope.productTypes[v]))
                                        real.productStr += $scope.productTypes[v];
                                } else {
                                    if (angular.isDefined($scope.productTypes[v]))
                                        real.productStr += ', ' + $scope.productTypes[v];
                                }
                            });
                        }  

                        if (angular.isDefined(real.postMetas.vinhomes_basic_acreage_value)) {
                            var arrayAcreages = real.postMetas.vinhomes_basic_acreage_value.split(', ');

                            real.acreageStr = '';      
                            var $del_val = "";

                            if($.inArray("50-100", arrayAcreages) !== -1) {
                                if($.inArray("100-150", arrayAcreages) !== -1) {
                                    if($.inArray("150-300", arrayAcreages) !== -1) {
                                        $del_val = "50-100";
                                        arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);
                                        
                                        $del_val = "100-150";
                                        arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);

                                        $del_val = "150-300";
                                        arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);

                                        arrayAcreages.push("50-300");
                                    } else {
                                        $del_val = "50-100";
                                        arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);
                                        
                                        $del_val = "100-150";
                                        arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);

                                        arrayAcreages.push("50-150");
                                    }
                                }
                            } else if($.inArray("100-150", arrayAcreages) !== -1) {
                                if($.inArray("150-300", arrayAcreages) !== -1) {
                                    $del_val = "100-150";
                                    arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);

                                    $del_val = "150-300";
                                    arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);

                                    arrayAcreages.push("100-300");
                                } 
                            }

                            var $arrAcreTemp = {
                                '50-150' : '50-150m²',
                                '50-300' : '50-300m²',
                                '100-300' : '100-300m²'
                            };

                            angular.forEach(arrayAcreages, function(v, k) {
                                if (real.acreageStr == '') {
                                    if (angular.isDefined($scope.acreages[v])) {
                                        real.acreageStr += $scope.acreages[v];
                                    } else if (angular.isDefined($arrAcreTemp[v])) {
                                        real.acreageStr += $arrAcreTemp[v];
                                    }
                                } else {
                                    if (angular.isDefined($scope.acreages[v])) {
                                        real.acreageStr += ', ' + $scope.acreages[v];
                                    } else if (angular.isDefined($arrAcreTemp[v])) {
                                        real.acreageStr += ', ' + $arrAcreTemp[v];
                                    }
                                }
                            });

                        }  

                        if (angular.isDefined(real.postMetas.vinhomes_basic_room_number_value) && real.postMetas.vinhomes_basic_room_number_value !== null) {
                            var arrayRoomNumbers = real.postMetas.vinhomes_basic_room_number_value.split(', ');

                            real.roomNumberStr = '';      

                            angular.forEach(arrayRoomNumbers, function(v, k) {
                                if (real.roomNumberStr == '') {
                                    if (angular.isDefined($scope.roomsNumber[v])) {
                                        real.roomNumberStr += $scope.roomsNumber[v];
                                    } 
                                } else {
                                    if (angular.isDefined($scope.roomsNumber[v])) {
                                        real.roomNumberStr += ', ' + $scope.roomsNumber[v];
                                    } 
                                }
                            });
 
                        }
                    });

                    // Enable btn filter
                    $('#filterData').button('reset');

                    // Total items
                    $scope.totalItems = resultData.total;  

                    if (width_screen >= 768) {
                        // If user choose provinceId
                        if (angular.isDefined($scope.searchOptions.provinceId)) {
                            $scope.getListLocationProject($scope.searchOptions.provinceId);
                        }
                    } else {
                        // Close modal filter mobile
                        $("#filter-mobile .close").click();
                    }

                    $scope.firstLoadJS = false;

                    // Apply scope
                    $scope.$apply();
                }
            });
        }

        // Get real
        $scope.filterReals();

        $scope.getMoreReals = function() {
            $.ajax({
                type: 'POST',
                url: window.lang + "/real-api?type=" + $scope.typeSearch,
                data: {
                    pageOptions: $scope.pageOptions,
                    searchOptions: $scope.searchOptions
                },
                success: function(resultData) {

                    // Show or hide btn load more
                    $scope.hideBtnMore = false;
                    if (resultData.current_page >= resultData.last_page) {
                        $scope.hideBtnMore = true;
                    }

                    $scope.pageOptions.page = $scope.pageOptions.page + 1;

                    // Set reals data
                    $scope.realEstates = $scope.realEstates.concat(angular.copy(resultData.data));
                    //console.log(resultData.data);
                    // Get real product type
                    angular.forEach($scope.realEstates, function(real, index) {

                        // Resize inage
                        $scope.getImageResize(real.image_feature.src, 450, 4/3, 'event' + index);

                        // Get list product type
                        if (angular.isDefined(real.postMetas.vinhomes_basic_product_type_value)) {
                            var arrayProductTypes = real.postMetas.vinhomes_basic_product_type_value.split(', ');
                            real.productStr = '';
                            angular.forEach(arrayProductTypes, function(v, k) {
                                if (real.productStr == '') {
                                    if (angular.isDefined($scope.productTypes[v]))
                                        real.productStr += $scope.productTypes[v];
                                } else {
                                    if (angular.isDefined($scope.productTypes[v]))
                                        real.productStr += ', ' + $scope.productTypes[v];
                                }
                            });
                        }

                        if (angular.isDefined(real.postMetas.vinhomes_basic_acreage_value)) {
                            var arrayAcreages = real.postMetas.vinhomes_basic_acreage_value.split(', ');

                            real.acreageStr = '';      
                            var $del_val = "";

                            if($.inArray("50-100", arrayAcreages) !== -1) {
                                if($.inArray("100-150", arrayAcreages) !== -1) {
                                    if($.inArray("150-300", arrayAcreages) !== -1) {
                                        $del_val = "50-100";
                                        arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);
                                        
                                        $del_val = "100-150";
                                        arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);

                                        $del_val = "150-300";
                                        arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);

                                        arrayAcreages.push("50-300");
                                    } else {
                                        $del_val = "50-100";
                                        arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);
                                        
                                        $del_val = "100-150";
                                        arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);

                                        arrayAcreages.push("50-150");
                                    }
                                }
                            } else if($.inArray("100-150", arrayAcreages) !== -1) {
                                if($.inArray("150-300", arrayAcreages) !== -1) {
                                    $del_val = "100-150";
                                    arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);

                                    $del_val = "150-300";
                                    arrayAcreages.splice(arrayAcreages.indexOf($del_val),1);

                                    arrayAcreages.push("100-300");
                                } 
                            }

                            var $arrAcreTemp = {
                                '50-150' : '50-150m²',
                                '50-300' : '50-300m²',
                                '100-300' : '100-300m²'
                            };

                            angular.forEach(arrayAcreages, function(v, k) {
                                if (real.acreageStr == '') {
                                    if (angular.isDefined($scope.acreages[v])) {
                                        real.acreageStr += $scope.acreages[v];
                                    } else if (angular.isDefined($arrAcreTemp[v])) {
                                        real.acreageStr += $arrAcreTemp[v];
                                    }
                                } else {
                                    if (angular.isDefined($scope.acreages[v])) {
                                        real.acreageStr += ', ' + $scope.acreages[v];
                                    } else if (angular.isDefined($arrAcreTemp[v])) {
                                        real.acreageStr += ', ' + $arrAcreTemp[v];
                                    }
                                }
                            });
                        }  

                        if (angular.isDefined(real.postMetas.vinhomes_basic_room_number_value) && real.postMetas.vinhomes_basic_room_number_value !== null) {
                            var arrayRoomNumbers = real.postMetas.vinhomes_basic_room_number_value.split(', ');

                            real.roomNumberStr = '';      

                            angular.forEach(arrayRoomNumbers, function(v, k) {
                                if (real.roomNumberStr == '') {
                                    if (angular.isDefined($scope.roomsNumber[v])) {
                                        real.roomNumberStr += $scope.roomsNumber[v];
                                    } 
                                } else {
                                    if (angular.isDefined($scope.roomsNumber[v])) {
                                        real.roomNumberStr += ', ' + $scope.roomsNumber[v];
                                    } 
                                }
                            });

                        }
                    });

                    // Apply scope
                    $scope.$apply();
                }
            });
        }

        $timeout(function() {
            if(width_screen < 767){
                // Filter mobile
                var html_filter = $('#search-bds .filter').html();
                $('#filter-mobile .modal-body').append(html_filter);

                // Map
                $('#map').appendTo('#map-mobile .modal-body');
                $('#map-mobile .modal-content #map').css('height', (height_screen));
            }
        });

        $('.map-bds').on('click', function() {
            if (width_screen < 980) {
                // Call function get marker
                $scope.getListLocationProject($scope.searchOptions.provinceId);

                $timeout(function() {
                    $('#map').appendTo('#map-mobile .modal-body');
                    $('#map-mobile .modal-content #map').css('height', (height_screen));
                });
            }
        });
    });  
});


