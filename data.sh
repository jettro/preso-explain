#!/bin/bash

curl -s -XDELETE http://localhost:9200/slides

curl -s -XPUT 'http://localhost:9200/slides' -d '
{
  "mappings": {
    "slide": {
      "_id" : {
        "path" : "slideId"
      },
      "properties": {
        "slideId": {
          "type": "string",
          "index":"not_analyzed"
        },
        "title": {
          "type": "string"
        },
        "subTitle": {
          "type": "string"
        },
        "description": {
          "type": "string"
        },
        "content": {
          "type": "object", 
          "index": "no"
        },
        "nextSlide": {
          "type": "string",
          "index": "not_analyzed"
        }
      }
    }
  }
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"start",
	"title":"Getting the right results",
	"subTitle":"Jettro Coenradie",
	"description":"This is the start slide for the presentation and should show the title.",
	"content": [
		{
			"type":"image",
			"imgSource":"homepage.jpg"
		}
	],
	"nextSlide":"aboutme"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"aboutme",
	"title":"About me",
	"subTitle":"how to contact me",
	"description":"This slide shows some information about me. It gives you my twitter handle, my linkedin account and my github repository.",
	"content": [
		{
			"type":"table",
			"rows": [
				{
					"cols": ["twitter","@jettroCoenradie"]
				},
				{
					"cols": ["linkedin","https://www.linkedin.com/in/jettro"]
				},
				{
				  "cols": ["Github","https://github.com/jettro"]
				},
				{
				  "cols": ["Blog","http://www.gridshore.nl"]
				}
			]
		}
	],
	"nextSlide":"whatiselastic"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"whatiselastic",
	"title":"What is elasticsearch?",
	"subTitle":"",
	"description":"Start introducing elasticsearch, explain the vey basic things that need to be known.",
	"content": [
		{
			"type":"list",
			"items": [
			  "Scalable search solution",
			  "Schemaless, yeah right"
			]
		}
	],
	"nextSlide":"elasticlucene"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"elasticlucene",
	"title":"Elasticsearch and lucene",
	"subTitle":"cluster, index, shards, lucene",
	"description":"In here I want to explain the different concepts of elasticsearch.",
	"content": [
		{
			"type":"images",
			"imgSources": [
			  {"src":"elasticlucene1.png","visible":true},
			  {"src":"elasticlucene2.png","visible":true},
			  {"src":"elasticlucene3.png","visible":true},
			  {"src":"elasticlucene4.png","visible":true}
			]
		}
	],
	"nextSlide":"executingquery"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"executingquery",
	"title":"Executing a query",
	"subTitle":"basic concepts",
	"description":"In this slide I want to explain what it means to execute a query against elasticsearch.",
	"content": [
		{
			"type":"list",
			"items": [
			  "Use the REST api,",
			  "Use one of the drivers,",
			  "A lot of different queries,",
			  "Use query, filter, aggregations, highlighting, and ..."
			]
		}
	],
	"nextSlide":"showcurl"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"showcurl",
	"title":"Example with curl",
	"subTitle":"find all docs",
	"description":"In this slide we present you the most basic match all docs query using curl.",
	"content": [
		{
			"type":"image",
			"imgSource":"showcurl.png"
		}
	],
	"nextSlide":"otherquerytool"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"otherquerytool",
	"title":"Other query tools",
	"subTitle":"there are a lot",
	"description":"Some examples of other query tools that are available.",
	"content": [
		{
			"type":"list",
			"items": [
			  "Elasticsearch Marvel Sense,",
			  "Plugins: Elasticsearch gui, Head, Kopf",
			  "Java Driver and other language drivers",
			  "Any rest client"
			]
		}
	],
	"nextSlide":"executequery"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"executequery",
	"title":"Execute query",
	"subTitle":"query string query",
	"description":"This is the most basic variant of executing a query.",
	"content": [
		{
			"type":"query"
		}
	],
	"nextSlide":"start"
}'

