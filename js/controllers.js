'use strict';

/* Controllers 
http://chieffancypants.github.io/angular-hotkeys/
*/
function SlideCtrl($scope, elastic, $routeParams, hotkeys) {
    $scope.slide = "empty";
    $scope.searchText = "basic";
    $scope.searchOperator = "or";
    $scope.searchResults = null;

    hotkeys.add({
        combo: 'down',
        description: 'Go to the next slide.',
        callback: function() {
          $scope.showNextSlide();
        }
    });

    hotkeys.add({
        combo: 'up',
        description: 'Go to the previous slide.',
        callback: function() {
          $scope.showPreviousSlide();
        }
    });

    $scope.showSlide = function(slideId) {
        doShowSlide(slideId);
    }

    $scope.showNextSlide = function() {
        doShowSlide($scope.slide.nextSlide);
    }

    $scope.showPreviousSlide = function() {
        doShowPreviousSlide($scope.slide.slideId);
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

    function doShowSlide(slideId) {
        $scope.searchResults = null;
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