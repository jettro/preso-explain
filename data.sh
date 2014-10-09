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
					"cols": ["email","jettro.coenradie@luminis.eu"]
				},			
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
	"subTitle":"more than search",
	"description":"Start introducing elasticsearch, explain the vey basic things that need to be known.",
	"content": [
		{
			"type":"list",
			"items": [
				{
					"showme":true,
					"text":"Scalable search solution"
				},
				{
					"showme":false,
					"text":"Schemaless, yeah right"
				}
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
			  {"src":"elasticlucene1.png","showme":true},
			  {"src":"elasticlucene2.png","showme":true},
			  {"src":"elasticlucene3.png","showme":true},
			  {"src":"elasticlucene4.png","showme":true}
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
			{
				"showme":true,
				"text":"Use the REST api,"
			},
			{
				"showme":false,
				"text":"Use one of the drivers,"
			},
			{
				"showme":false,
				"text":"A lot of different queries,"
			},
			{
				"showme":false,
				"text":"Use query, filter, aggregations, highlighting, and ..."
			}
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
			{
				"showme":true,
				"text":"Elasticsearch Marvel Sense,"
			},
			{
				"showme":false,
				"text":"Plugins: Elasticsearch gui, Head, Kopf"
			},
			{
				"showme":false,
				"text":"Java Driver and other language drivers"
			},
			{
				"showme":false,
				"text":"Any rest client"
			}
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
			"type":"notification",
			"text":"GET /slides/_search"
		},
		{
			"type":"query",
			"queryType":"match",
			"explain":false,
			"query": {
				"query": {
					"match": {
						"description":"What you type!"
					}
				}
			}
		}
	],
	"nextSlide":"sortingresults"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"sortingresults",
	"title":"Sorting results",
	"subTitle":"by score and ...",
	"description":"In this slide I want to discuss the options you have for sorting results.",
	"content": [
		{
			"type":"list",
			"items": [
			  {
				"showme":true,
				"text":"Sort by score (the default),"
			},
			{
				"showme":false,
				"text":"Sort by date,"
			},
			{
				"showme":false,
				"text":"Sort by analyzed fields,"
			}
			]
		},
		{
			"type":"notification",
			"text":"GET /slides/_search"
		},
		{
			"type":"query",
			"queryType":"sort",
			"explain":false,
			"query": {
				"query": {
					"match": {
						"description":"What you type!"
					}
				},
				"sort": [
    				{
      					"slideId": {
        					"order": "asc"
      					}
    				}
  				]
			}
		}
	],
	"nextSlide":"validatequery"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"validatequery",
	"title":"Validate query",
	"subTitle":"using validate api",
	"description":"In this slide we are going to demonstrate the validate api for a query using explain as well, showing the query_string translation.",
	"content": [
		{
			"type":"notification",
			"text":"POST /slides/_validate/query?explain"
		},
		{
			"type":"query",
			"queryType":"validate",
			"query": {
				"query": {
					"multi_match": {
					  "query": "basic search",
					  "fields": ["description","title","subTitle"]
					}
				}
			}
		}
	],
	"nextSlide":"explainquery"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explainquery",
	"title":"Explain query results",
	"subTitle":"use the explain api",
	"description":"Here we are going to discuss the most basic explain you can get.",
	"content": [
		{
			"type":"notification",
			"text":"GET /slides/_search?explain"
		},
		{
			"type":"query",
			"queryType":"match",
			"explain":true,
			"query": {
				"query": {
					"match": {
						"description":"What you type!"
					}
				}
			}
		}
	],
	"nextSlide":"explainqueryexplained"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explainqueryexplained",
	"title":"Explain query explained",
	"subTitle":"the basics",
	"description":"In this slide I am going to show details about the explain basics.",
	"content": [
		{
			"type":"images",
			"imgSources": [
			  {"src":"explainqueryexplained1.png","showme":true},
			  {"src":"explainqueryexplained2.png","showme":false},
			  {"src":"explainqueryexplained3.png","showme":false},
			  {"src":"explainqueryexplained4.png","showme":false},
			  {"src":"explainqueryexplained5.png","showme":false},
			  {"src":"explainqueryexplained6.png","showme":false}
			]
		}
	],
	"nextSlide":"explaintheorysimilarity"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explaintheorysimilarity",
	"title":"Calculating score",
	"subTitle":"the theory",
	"description":"In this slide we are going to explain the theory behind creating score using simulariry algorithms.",
	"content": [
		{
			"type":"list",
			"items": [
				{
					"showme":true,
					"text":"Score is calculated for matching documents,"
				},
				{
					"showme":false,
					"text":"Score represents how similar the search terms and the document terms are,"
				},
				{
					"showme":false,
					"text":"Default for Lucene is comination of Boolean Model, TF/IDF and the Vector Space Model,"
				},
				{
					"showme":false,
					"text":"Other algorithms are available: BM25"
				}
			]
		}
	],
	"nextSlide":"explaintheorytfidf"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explaintheorytfidf",
	"title":"Calculating score",
	"subTitle":"the terms",
	"description":"This slide gives an overview of the most important definitions for calculating the score.",
	"content": [
		{
			"type":"table",
			"rows": [
				{
					"cols": ["queryNorm","Attempt to make different queries comparable."]
				},			
				{
					"cols": ["coord","Factor for total score based on amount of queried and found terms"]
				},
				{
					"cols": ["Term frequency","Amount of times a term is matched in the field"]
				},
				{
				    "cols": ["Inverse document frequency","amount of documents that have the term"]
				},
				{
				    "cols": ["fieldNorm","Length of the field the terms was found in"]
				},
				{
				    "cols": ["boost","Boost a field score"]
				}
			]
		}
	],
	"nextSlide":"explaintablematchquery"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explaintablematchquery",
	"title":"An explain example",
	"subTitle":"using match query",
	"description":"In this slide we are going to use a very simple match query with an index containing only three documents.",
	"content": [
		{
			"type":"notification",
			"text":"Show tf/idf/fieldNorm and score"
		},
		{
			"type":"table",
			"rows": [
				{
					"cols": ["","Doc 1","Doc 2", "Doc 3"]
				},			
				{
					"cols": ["","one two three","two three", "three"]
				},			
				{
					"cols": ["one", "1 / 1 / 0.5", "", ""]
				},
				{
					"cols": ["","0.702", "",""]
				},
				{
				    "cols": ["two","1 / 2 / 0.5", "1 / 2 / 0.625", ""]
				},
				{
				    "cols": ["","0.5","0.625",""]
				},
				{
				    "cols": ["three","1 / 3 / 0.5", "1 / 3 / 0.625", "1 / 3 / 1"]
				},
				{
				    "cols": ["","0.356","0.445","0.712"]
				}
			]			
		}
	],
	"nextSlide":"explainonetwothree"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explainonetwothree",
	"title":"Explain multiple terms",
	"subTitle":"with a trick",
	"description":"Here we are going to shows what happens to the results when using capital letters, multipe terms and introduce the camel case analyzer.",
	"content": [
		{
			"type":"notification",
			"text":"GET /onetwothree/_search?explain"
		},
		{
			"type":"query123"
		}
	],
	"nextSlide":"whatisanalyser"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"whatisanalyser",
	"title":"What is an analyzer",
	"subTitle":"the parts",
	"description":"Explain what the different components of an analyzer are.",
	"content": [
		{
			"type":"table",
			"rows": [
				{
					"cols": ["Character filters","Tidy up the string before tokenising."]
				},			
				{
					"cols": ["Tokeniser","Splits the string into a number of tokens"]
				},
				{
					"cols": ["Token filters","Do something with the tokens"]
				}
			]
		}
	],
	"nextSlide":"showananalyser"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"showananalyser",
	"title":"Show an analyzer",
	"subTitle":"a basic analyzer",
	"description":"Explain what the different components of an analyzer are.",
	"content": [
		{
			"type":"notification",
			"text":"PUT /newindex"
		},
		{
			"type":"code",
			"code": {
			  "settings": {
			      "analysis": {
			        "analyzer": {
			          "filtered_keyword" : {
			            "type":"custom",
			            "tokenizer":"keyword",
			            "filter": ["lowercase","asciifolding"]
			          }
			        }
			      }
			  },
			  "mappings": {
			    "mytype": {
			      "properties": {
			        "title": {
			          "type": "string",
			          "analyzer": "filtered_keyword"
			        }
			      }
			    }
			  }
			}
		}
	],
	"nextSlide":"onetwothreeanalyzer"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"onetwothreeanalyzer",
	"title":"One Two Three Analyzer",
	"subTitle":"Camel case",
	"description":"Show the analyzer as used in the onetwothree sample with the camel case.",
	"content": [
		{
			"type":"notification",
			"text":"GET /onetwothree/_settings"
		},
		{
			"type":"executeget",
			"executetype":"settings",
			"parameter":"onetwothree"
		}
	],
	"nextSlide":"start"
}'


