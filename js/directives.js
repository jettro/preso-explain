'use strict';

/* Directives */


angular.module('myApp.directives', []).
directive('slider', function($timeout) {
	// http://www.sitepoint.com/creating-slide-show-plugin-angularjs/
  return {
    restrict: 'AE',
    replace: true,
    scope: {
      images: '=',
      hideProgress: '='
    },
    link: function(scope, elem, attrs) {
    	scope.currentIndex = 0; // Initially the index is at the first image
      scope.listProgress = 0;

  		scope.next = function() {
  			scope.currentIndex < scope.images.length - 1 ? scope.currentIndex++ : scope.currentIndex = 0;
        scope.listProgress = (scope.currentIndex / (scope.images.length-1))*100;
  		}; 

  		scope.$watch('currentIndex', function() {
  			scope.images.forEach(function(image) {
  				image.showme = false; // make every image invisible
  			}); 
  			scope.images[scope.currentIndex].showme = true; // make the current image visible
  		});
    },
    templateUrl: 'templates/images.html'
  };
}).
directive('bullits', function($timeout) {
  return {
    restrict: 'AE',
    replace: true,
    scope: {
      hideprogress: '=',
      listitems: '=',
      format: '='
    },
    link: function(scope, elem, attrs) {
      scope.currentIndex = 0;
      scope.listProgress = 0;

      scope.nextItem = function() {
        if (scope.currentIndex < scope.listitems.length - 1) {
          scope.currentIndex++;
          scope.listProgress = (scope.currentIndex / (scope.listitems.length-1))*100;
        }
      }; 

      scope.$watch('currentIndex', function() {
        scope.listitems[scope.currentIndex].showme = true;
      });
    },
    templateUrl: 'templates/bullits.html'
  };
});

