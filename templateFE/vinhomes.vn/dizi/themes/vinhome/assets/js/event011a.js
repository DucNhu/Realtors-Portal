var app = angular.module('myApp', []);
app.controller('eventController', function ($scope, $timeout, $http) {

    // Show loading
    var optionsHoldOn = {
        theme: "sk-bounce",
        message: '',
        backgroundColor: "#000",
        textColor: "white"
    };
    $timeout(function () {

        $scope.pageOptions = {
            page: 1,
            items_per_page: 3
        };

        $scope.renderData = function (v, k) {
            $timeout(function () {
                $http({
                    method: 'GET',
                    url: window.lang + "/api/event/" + v
                }).then(function successCallback(data) {
                    $scope.dataEvent[k].name = angular.isDefined(data.data.name) ? data.data.name : '';
                    $scope.dataEvent[k].address = (angular.isDefined(data.data.place) && angular.isDefined(data.data.place.location) && angular.isDefined(data.data.place.location.street)) ? data.data.place.location.street : '';
                    $scope.dataEvent[k].start_time = angular.isDefined(data.data.start_time) ? data.data.start_time : '';
                    $scope.dataEvent[k].end_time = angular.isDefined(data.data.end_time) ? data.data.end_time : '';
                    if (angular.isDefined(data.data.end_time)) {
                        var dateParts = data.data.end_time.substring(0, 10).split('-');
                        var timePart = data.data.end_time.substr(11);
                        var myDate = dateParts[1] + '/' + dateParts[2] + '/' + dateParts[0] + ' ' + timePart;
                    }
                    $scope.dataEvent[k].has_taken = (angular.isDefined(myDate) && new Date() > new Date(myDate)) ? true : false;
                }, function errorCallback(response) {
                    $scope.dataEvent[k].error = true;
                });
                // Get cover photo
                $http({
                    method: 'GET',
                    url: 'https://graph.facebook.com/' + v +
                    '?access_token=' + $scope.facebook_token + '&fields=cover'
                }).then(function successCallback(data) {
                    // Get cover photo of event
                    var coverPhoto = {};
                    coverPhoto.src = data.data.cover.source;
                    coverPhoto.alt = '';

                    $scope.dataEvent[k].image = coverPhoto;
                    if (k == 0) {

                        HoldOn.close();
                    }
                }, function errorCallback(response) {
                    $scope.dataEvent[k].image = '';
                });
            })
        };

        $(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() >= ($(document).height() - $('.footer').height() - 100)) { //scrolled to bottom of the page
                $scope.loadMore(true);
            }
        });

        $scope.dataEvent = [];
        $scope.isLoad = true;
        $scope.loadMore = function (isLoadMore) {

            if ($scope.isLoad) {
                $scope.isLoad = false;
                if (isLoadMore)
                    $scope.pageOptions.page++;
                $.ajax({
                    type: 'GET',
                    url: window.lang + "/api/event",
                    data: {
                        pageOptions: $scope.pageOptions
                    },
                    success: function (resultData) {
                        if (resultData.lastPage == $scope.pageOptions.page) {
                            isLoadMore = false;
                        }
                        if (angular.isDefined(resultData.data)) {
                            angular.forEach(resultData.data, function (value, key) {
                                var event = {};
                                angular.forEach(value.post_metas, function (v, k) {
                                    event.slug = value.slug;
                                    event.name = angular.isDefined(value.title) ? value.title : '';
                                    if (k == 'vinhomes_event')
                                        event.id = v;
                                    if(k=='vinhomes_start_time')
                                        event.start_time = angular.isDefined(v) ? v : '';
                                    if(k=='vinhomes_end_time'){
                                        event.end_time = angular.isDefined(v) ? v : '';
                                    }else{

                                    }
                                    if(k=='vinhomes_address')
                                        event.address = angular.isDefined(v) ? v : '';
                                    // event.address = (angular.isDefined(data.data.place) && angular.isDefined(data.data.place.location) && angular.isDefined(data.data.place.location.street)) ? data.data.place.location.street : '';
                                    if (angular.isDefined(event.end_time) && event.end_time !=null) {
                                        var dateParts = event.end_time.substring(0, 10).split('-');
                                        var timePart = event.end_time.substr(11);
                                        var myDate = dateParts[1] + '/' + dateParts[2] + '/' + dateParts[0] + ' ' + timePart;
                                    }
                                    event.has_taken = (angular.isDefined(myDate) && new Date() > new Date(myDate)) ? true : false;

                                    event.image = $.parseJSON(value.image_feature);
                                });
                                $scope.dataEvent.push(event);


                                $scope.$apply();
                            });
                            console.log($scope.dataEvent);
                        } else {
                            HoldOn.close();
                        }

                        $scope.isLoad = true;
                    }
                });
            }
        }

        $scope.loadMore(false);
            console.log($('.isShow'));
        $('.isShow').removeClass('hide');
    })

});
