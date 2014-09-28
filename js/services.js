'use strict';

/* Services */
var serviceModule = angular.module('myApp.services', []);

serviceModule.factory('elastic', ['esFactory', '$q', function (esFactory, $q) {
    function ElasticService(esFactory, $q) {
        var serverUrl = "http://localhost:9200";
        var es = createEsFactory();

        this.obtainSlide = function(slideId, resultCallback) {
            var getObj = {"index":"slides","type":"slide"};
            getObj.id = slideId; 
            es.getSource(getObj).then(function(results){
                resultCallback(results);
            },function(errors){
                console.log(errors);
            });
            resultCallback(slideId);
        };

        this.obtainPreviousSlide = function(slideId, resultCallback) {
            var query = {"index":"slides","type":"slide","q":"nextSlide:"+slideId};
            es.search(query).then(function (results){
                if (results.hits.hits) {
                    resultCallback(results.hits.hits[0]._source);
                } else {
                    resultCallback(null);
                }
            }, function (errors){
                console.log(errors);
            });
        };

        this.doSearch = function (query, resultCallback) {
            if (query.index === "") {
                query.index = activeIndexes;
            }
            es.search(query).then(function (results) {
                resultCallback(results)
            }, function (errors) {
                console.log(errors);
            });
        };

        function createEsFactory() {
            return esFactory({"host": serverUrl, "apiVersion": "1.3"});
        }
    }

    return new ElasticService(esFactory, $q);
}]);