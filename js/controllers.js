'use strict';

/* Controllers 
http://chieffancypants.github.io/angular-hotkeys/
*/
function SlideCtrl($scope, elastic, $routeParams, hotkeys, $location) {
    $scope.slide = "empty";
    $scope.searchText = "basic";
    $scope.searchOperator = "or";
    $scope.searchResults = null;
    $scope.listItems = [];

    hotkeys.add({
        combo: 'down',
        description: 'Go to the next slide.',
        callback: function() {
            var path = $location.path().replace($scope.slide.slideId,$scope.slide.nextSlide);
            $location.path(path);
        }
    });

    hotkeys.add({
        combo: 'up',
        description: 'Go to the previous slide.',
        callback: function() {
            doShowPreviousSlide($scope.slide.slideId);
        }
    });

    $scope.executeSearch = function(queryType,explain,searchText) {
        elastic.doMatchDescription(queryType, searchText, explain, function(data) {
            $scope.searchResults = data;
        });
    }

    $scope.executeSearch123 = function(searchText,searchOperator) {
        elastic.doMatch123(searchText, searchOperator, function(data) {
            $scope.searchResults = data;
        });
    }

    $scope.executeQuery = function(type,parameter) {
        if ("settings" === type) {
            elastic.obtainSettings(parameter, function(data) {
                $scope.searchResults = data;
            });            
        } else if ("mappings" === type) {
            elastic.obtainMappings(parameter, function(data) {
                $scope.searchResults = data;
            });            
        } else if ("analyze" === type) {
            elastic.doAnalyze(parameter[0],parameter[1],parameter[2], function(data){
                $scope.searchResults = data;
            });
        }
    }

    $scope.showNextItem = function(items, currentItem) {
        if (currentItem < items.length) {
            items[currentItem+1].visible = true;
        }
    }

    function doShowSlide(slideId) {
        $scope.searchResults = null;
        $scope.searchOperator = "or";
        elastic.obtainSlide(slideId, function(data) {
            $scope.slide = data;
        });
    }

    function doShowPreviousSlide(slideId) {
        elastic.obtainPreviousSlide(slideId, function(data) {
            if (data) {
                var path = $location.path().replace(data.nextSlide,data.slideId);
                $location.path(path);
            }
        });
    }

    $scope.$on('$viewContentLoaded', function () {
        doShowSlide($routeParams.slideId);
    });
}
SlideCtrl.$inject = ['$scope', 'elastic', '$routeParams', 'hotkeys', '$location'];

function SearchCtrl($scope, elastic, $location) {
    $scope.searchResults = [];

    $scope.openSlide = function(slideId) {
        $location.path('/slide/'+slideId);
    }

    function doShowSlide(slideId) {
        elastic.obtainSlide(slideId, function(data) {
            $scope.searchResults.push(data);
            if ("start" != data.nextSlide) {
                doShowSlide(data.nextSlide)
            }
        });
    }

    $scope.$on('$viewContentLoaded', function () {
        doShowSlide("start");
    });    
}
SearchCtrl.$inject = ['$scope', 'elastic', '$location'];