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
	"nextSlide":"start"
}'

