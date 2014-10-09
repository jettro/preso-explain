'use strict';

/* Directives */


angular.module('myApp.directives', []).
directive('slider', function($timeout) {
	// http://www.sitepoint.com/creating-slide-show-plugin-angularjs/
  return {
    restrict: 'AE',
    replace: true,
    scope: {
      images: '='
    },
    link: function(scope, elem, attrs) {
    	scope.currentIndex = 0; // Initially the index is at the first image

  		scope.next = function() {
  			scope.currentIndex < scope.images.length - 1 ? scope.currentIndex++ : scope.currentIndex = 0;
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
      listitems: '='
    },
    link: function(scope, elem, attrs) {
      scope.currentIndex = 0;

      scope.nextItem = function() {
        if (scope.currentIndex < scope.listitems.length - 1) {
          scope.currentIndex++;
        }
      }; 

      scope.$watch('currentIndex', function() {
        scope.listitems[scope.currentIndex].showme = true;
      });
    },
    templateUrl: 'templates/bullits.html'
  };
});

