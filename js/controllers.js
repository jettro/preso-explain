'use strict';

/* Controllers 
http://chieffancypants.github.io/angular-hotkeys/
*/
function SlideCtrl($scope, elastic, $routeParams, hotkeys) {
    $scope.slide = "empty";
    $scope.searchText = "basic";
    $scope.searchOperator = "or";
    $scope.searchResults = null;
    $scope.listItems = [];

    hotkeys.add({
        combo: 'down',
        description: 'Go to the next slide.',
        callback: function() {
            doShowSlide($scope.slide.nextSlide);
        }
    });

    hotkeys.add({
        combo: 'up',
        description: 'Go to the previous slide.',
        callback: function() {
            doShowPreviousSlide($scope.slide.slideId);
        }
    });

    $scope.showSlide = function(slideId) {
        doShowSlide(slideId);
    }

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
                $scope.slide = data;
            }
        });
    }

    $scope.$on('$viewContentLoaded', function () {
        var startSlide = $routeParams.slideId;
        doShowSlide(startSlide);
    });
}
SlideCtrl.$inject = ['$scope', 'elastic', '$routeParams', 'hotkeys'];

function SearchCtrl($scope, elastic) {

}
SearchCtrl.$inject = ['$scope', 'elastic'];