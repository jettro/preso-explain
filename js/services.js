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

        // queryType can be: match,multi_match_best,multi_match_most,multi_match_cross
        this.doValidateQuery = function(textToFind, queryType, resultCallback) {
            var query = {"index":"slides","explain":true,"body":{}};
            if (queryType === "match") {
                query.body.query = {"match":{"description":textToFind}};
            } else if (queryType === "match_and") {
                query.body.query = {"match":{"description":{"query":textToFind,"operator":"and"}}};
            } else {
                query.body.query = {
                    "multi_match": {
                        "query": textToFind,
                        "fields":["title","subtitle","description"],
                        "type":queryType
                    }
                };
            }
            es.indices.validateQuery(query)
                .then(function (results) {
                    resultCallback(results)
                }, function (errors) {
                    console.log(errors);
                });
        };

        this.doMatchDescription = function(queryType, textToFind, explain, resultCallback) {
            if (queryType === "validate") {
                es.indices.validateQuery({
                    "index":"slides",
                    "explain": true,
                    "body": {
                        "query": {
                            "multi_match": {
                                "query": textToFind,
                                "fields": ["description","title","subTitle"]
                            }
                        }
                    }
                }).then(function (results) {
                    resultCallback(results)
                }, function (errors) {
                    console.log(errors);
                });
            } else {
                var query = {};
                if (queryType === "match") {
                    query = {"query":{"match":{"description":textToFind}}};
                } else if (queryType === "sort") {
                    query = {"query":{"match":{"description":textToFind}},"sort":[{"slideId":{"order":"asc"}}]};
                }
                es.search({
                    "index":"slides",
                    "explain":explain,
                    "body": query
                }).then(function (results) {
                    resultCallback(results)
                }, function (errors) {
                    console.log(errors);
                });
            }
        };

        this.doMatch123 = function(textToFind, useOperator, resultCallback){
            var query = {};
            query = {"query":{"match":{"title":{"query":textToFind,"operator":useOperator}}}};
            es.search({
                "index":"onetwothree",
                "explain":true,
                "body": query
            }).then(function (results) {
                resultCallback(results)
            }, function (errors) {
                console.log(errors);
            });            
        };

        this.doSearch = function (query, resultCallback) {
            es.search(query).then(function (results) {
                resultCallback(results)
            }, function (errors) {
                console.log(errors);
            });
        };

        this.obtainSettings = function(index, resultCallback) {
            es.indices.getSettings({"index":index}).then(function(results) {
                resultCallback(results);
            }, function(errors) {
                console.log(errors);
            });
        }

        this.obtainMappings = function(index, resultCallback) {
            es.indices.getMapping({"index":index}).then(function(results) {
                resultCallback(results);
            }, function(errors) {
                console.log(errors);
            });
        }

        this.doAnalyze = function(index, analyzer, text, resultCallback) {
            es.indices.analyze({"index":index, "analyzer":analyzer, "text": text})
                .then(function(results) {
                    resultCallback(results);
                }, function(errors) {
                    console.log(errors);
                });
        }

        function createEsFactory() {
            return esFactory({"host": serverUrl, "apiVersion": "1.3"});
        }
    }

    return new ElasticService(esFactory, $q);
}]);