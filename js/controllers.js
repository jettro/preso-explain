'use strict';

/* Controllers 
http://chieffancypants.github.io/angular-hotkeys/
*/
function SlideCtrl($scope, elastic, $routeParams, hotkeys) {
    $scope.slide = "empty";

    hotkeys.add({
        combo: 'right',
        description: 'Go to the next slide.',
        callback: function() {
          $scope.showNextSlide();
        }
    });

    hotkeys.add({
        combo: 'left',
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

    function doShowSlide(slideId) {
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