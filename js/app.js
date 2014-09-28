'use strict';

// Declare app level module which depends on filters, and services
var myApp = angular.module('myApp', ['ngRoute','myApp.filters', 'myApp.services', 'myApp.directives', 'ui.bootstrap','elasticsearch','cfp.hotkeys']).
        config(['$routeProvider', function ($routeProvider) {
            $routeProvider.when('/slide/:slideId', {templateUrl: 'partials/slide.html', controller: SlideCtrl});
            $routeProvider.when('/search', {templateUrl: 'partials/search.html', controller: SearchCtrl});
            $routeProvider.otherwise({redirectTo: '/slide/start'});
        }]);
        