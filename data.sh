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
    "hidetitle":true,
	"title":"Getting the right results",
	"subTitle":"Jettro Coenradie",
	"description":"This presentation is about getting the right results from elasticsearch. You will get an introduction into different kind of queries that you can use, the impact of analysers on results and we take a deep dive into the explain functionality. Using the explain functionality you can find out why one document is matching better than another.",
	"content": [
		{
			"type":"illustration",
			"imgSource":"jfall-logo.png",
			"size":"onethird",
			"pullright":false
		},
		{
			"type":"quote",
			"text":"Returning the right results",
			"author":"@jettroCoenradie"
		},
		{
			"type":"illustration",
			"imgSource":"luminis-logo.png",
			"size":"onethird",
			"pullright":false
		}
	],
	"nextSlide":"aboutme"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"aboutme",
	"title":"About me",
	"subTitle":"how to contact me",
	"description":"My name is Jettro Coenradie, I am the follow of Luminis Amsterdam. My specialty is search solutions and specifically elasticsearch. You can follow me on twitter, linkedin and my code is on github.",
	"content": [
		{
			"type":"table",
			"firstColHeading":true,
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
	"description":"Start introducing elasticsearch, explain the very basic things that need to be known.",
	"content": [
		{
			"type":"list",
			"items": [
				{
					"showme":true,
					"text":"Scalable search solution,"
				},
				{
					"showme":false,
					"text":"Find similar texts to provided words,"
				},
				{
					"showme":false,
					"text":"Filter documents by exact matches,"
				},
				{
					"showme":false,
					"text":"Create buckets of data by some condition,"
				},
				{
					"showme":false,
					"text":"Build using java on top of lucene,"
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
	"description":"In here I want to explain the different components of an elasticsearch cluster. I am showing images containing the structure of these components. A cluster contains multiple nodes. Each nodes contains shards of multiple indices. Each shard is a lucene index.",
	"content": [
		{
			"type":"images",
			"imgSources": [
			  {"src":"elasticlucene-1.jpg","showme":true},
			  {"src":"elasticlucene-2.jpg","showme":true},
			  {"src":"elasticlucene-3.jpg","showme":true},
			  {"src":"elasticlucene-4.jpg","showme":true}
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
			"type":"images",
			"imgSources": [
			  {"src":"executingquery-1.jpg","showme":true},
			  {"src":"executingquery-2.jpg","showme":true},
			  {"src":"executingquery-3.jpg","showme":true}
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
				"showme":true,
				"text":"Sort by date,"
			},
			{
				"showme":true,
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
					"text":"Score is calculated for matching documents (Boolean Model),"
				},
				{
					"showme":false,
					"text":"Score represents similarity between search and document terms,"
				},
				{
					"showme":false,
					"text":"Lucene uses enhanced TF/IDF (coordination factor and field length),"
				},
				{
					"showme":false,
					"text":"Other algorithms can be used: Okapi BM25"
				}
			]
		}
	],
	"nextSlide":"lucenebooleanmodel"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"lucenebooleanmodel",
	"title":"Boolean model",
	"subTitle":"must, must_not and should",
	"description":"In this slide we are going to explain the transformation of all queries into a bool query.",
	"content": [
		{
			"type":"code",
			"code": {
			  "query": {
			    "match": {
			      "description": "basic search elasticsearch"
			    }
			  }
			}
		},
		{
			"type":"code",
			"code": {
			  "query": {
			    "bool": {
			      "should": [
			        {
			          "term": {
			            "description": {
			              "value": "basic"
			            }
			          }
			        },
			        {
			          "term": {
			            "description": {
			              "value": "search"
			            }
			          }
			        },
			        {
			          "term": {
			            "description": {
			              "value": "elasticsearch"
			            }
			          }
			        }
			      ]
			    }
			  }
			}			
		}
	],
	"nextSlide":"lucenesimilarityformula"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"lucenesimilarityformula",
	"title":"Lucene similarity",
	"subTitle":"formula",
	"description":"Shows the formula used by lucene to calculate the score.",
	"content": [
		{
			"type":"image",
			"imgSource":"lucenesimilarityformula.png"
		},
		{
			"type":"reference",
			"reference":"https://lucene.apache.org/core/4_0_0/core/org/apache/lucene/search/similarities/TFIDFSimilarity.html"
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
			"firstColHeading":true,
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
			"firstColHeading":true,
			"class":"table-bordered table-hover",
			"rows": [
				{
					"cols": ["","Doc 1","Doc 2", "Doc 3"]
				},			
				{
					"highlight":true,
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
			"firstColHeading":true,
			"class":"table-bordered",
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
	"subTitle":"settings",
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
	"nextSlide":"onetwothreeanalyzer2"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"onetwothreeanalyzer2",
	"title":"One Two Three Analyzer",
	"subTitle":"mappings",
	"description":"Show the analyzer as used in the onetwothree sample with the camel case.",
	"content": [
		{
			"type":"notification",
			"text":"GET /onetwothree/_mappings"
		},
		{
			"type":"executeget",
			"executetype":"mappings",
			"parameter":"onetwothree"
		}
	],
	"nextSlide":"onetwothreeanalyzer3"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"onetwothreeanalyzer3",
	"title":"One Two Three Analyzer",
	"subTitle":"analyze api",
	"description":"Test the analyzer using the analyze api.",
	"content": [
		{
			"type":"notification",
			"text":"GET /onetwothree/_analyze?analyzer=camel&text=OneTwoThree"
		},
		{
			"type":"executeget",
			"executetype":"analyze",
			"parameter":["onetwothree","camel","OneTwoThree"]
		}
	],
	"nextSlide":"backtoexplain"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"backtoexplain",
	"title":"Back to explain",
	"subTitle":"recap single term",
	"description":"In this slide we get back to the explain api, from the image with the real explain output we introduce a short notation.",
	"content": [
		{
			"type":"notification",
			"text":"GET /slides/_search?explain"
		},
		{
			"type":"code",
			"code": {
			  "query": {
			    "match": {
			      "description": "basic"
			    }
			  }
			}
		},
		{
			"type":"image",
			"imgSource":"backtoexplain.png"
		},
		{
			"type":"table",
			"class":"table-bordered table-hover",
			"rows": [
				{
					"highlight":true,
					"colspan":"3",
					"cols":["structure of the score calculation"]
				},
				{
					"cols": ["description:basic","",""]
				},			
				{
					"cols": ["","[*]",""]
				},
				{
					"cols": ["","","tf / idf / fieldNorm"]
				}
			]
		}
	],
	"nextSlide":"explain2terms"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explain2terms",
	"title":"Explain 2 terms",
	"subTitle":"match with 2",
	"description":"Now we are going to show the short notation for the explaination of a query with two terms due to a standard analyzer.",
	"content": [
		{
			"type":"notification",
			"text":"GET /slides/_search?explain"
		},
		{
			"type":"code",
			"code": {
			  "query": {
			    "match": {
			      "description": "basic search"
			    }
			  }
			}
		},
		{
			"type":"table",
			"class":"table-bordered table-hover",
			"rows": [
				{
					"highlight":true,
					"colspan":"3",
					"cols":["structure of the score calculation"]
				},
				{
					"cols": ["[*]","",""]
				},			
				{
					"cols": ["","[+]",""]
				},
				{
					"cols": ["","","description:basic"]
				},
				{
					"cols": ["","coord (1/2)",""]
				}
			]
		}
	],
	"nextSlide":"explain3terms"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explain3terms",
	"title":"Explain 3 terms",
	"subTitle":"match with 3",
	"description":"Now we are going to show the short notation for the explaination of a query with three terms due to a standard analyzer.",
	"content": [
		{
			"type":"notification",
			"text":"GET /slides/_search?explain"
		},
		{
			"type":"code",
			"code": {
			  "query": {
			    "match": {
			      "description": "basic search elasticsearch"
			    }
			  }
			}
		},
		{
			"type":"table",
			"class":"table-bordered table-hover",
			"rows": [
				{
					"highlight":true,
					"colspan":"3",
					"cols":["structure of the score calculation"]
				},
				{
					"cols": ["[*]","",""]
				},			
				{
					"cols": ["","[+]",""]
				},
				{
					"cols": ["","","description:basic"]
				},
				{
					"cols": ["","","description:elasticsearch"]
				},
				{
					"cols": ["","coord (2/3)",""]
				}
			]
		}
	],
	"nextSlide":"explainbestof"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explainbestof",
	"title":"Explain multi_field",
	"subTitle":"best_fields",
	"description":"Show the effect of a multi_field query using the default best_fields type.",
	"content": [
		{
			"type":"notification",
			"text":"GET /slides/_search?explain"
		},
		{
			"type":"code",
			"code": {
			  "query": {
			    "multi_match": {
			      "query": "basic query",
			      "fields": ["title","description"],
			      "type": "best_fields"
			    }
			  }
			}
		},
		{
			"type":"table",
			"class":"table-bordered table-hover",
			"rows": [
				{
					"highlight":true,
					"colspan":"4",
					"cols":["structure of the score calculation"]
				},
				{
					"cols": ["[max_of]","","",""]
				},			
				{
					"cols": ["","[+]","",""]
				},
				{
					"cols": ["","","description:basic",""]
				},
				{
					"cols": ["","","description:query",""]
				},
				{
					"cols": ["","[*]","",""]
				},
				{
					"cols": ["","","[+]",""]
				},
				{
					"cols": ["","","","title:query"]
				},
				{
					"cols": ["","","coord (1/2)",""]
				}
			]
		}
	],
	"nextSlide":"explainmostfields"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explainmostfields",
	"title":"Explain multi_field",
	"subTitle":"most_fields",
	"description":"Show the effect of a multi_field query using the most_fields type.",
	"content": [
		{
			"type":"notification",
			"text":"GET /slides/_search?explain"
		},
		{
			"type":"code",
			"code": {
			  "query": {
			    "multi_match": {
			      "query": "basic query",
			      "fields": ["title","description"],
			      "type": "most_fields"
			    }
			  }
			}
		},
		{
			"type":"table",
			"class":"table-bordered table-hover",
			"rows": [
				{
					"highlight":true,
					"colspan":"4",
					"cols":["structure of the score calculation"]
				},
				{
					"cols": ["[sum_of]","","",""]
				},			
				{
					"cols": ["","[+]","",""]
				},
				{
					"cols": ["","","description:basic",""]
				},
				{
					"cols": ["","","description:query",""]
				},
				{
					"cols": ["","[*]","",""]
				},
				{
					"cols": ["","","[+]",""]
				},
				{
					"cols": ["","","","title:query"]
				},
				{
					"cols": ["","","coord (1/2)",""]
				}
			]
		}
	],
	"nextSlide":"explaincrossfields"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explaincrossfields",
	"title":"Explain multi_field",
	"subTitle":"cross_fields",
	"description":"Show the effect of a multi_field query using the cross_fields type.",
	"content": [
		{
			"type":"notification",
			"text":"GET /slides/_search?explain"
		},
		{
			"type":"code",
			"code": {
			  "query": {
			    "multi_match": {
			      "query": "basic query",
			      "fields": ["title","description"],
			      "type": "cross_fields"
			    }
			  }
			}
		},
		{
			"type":"table",
			"class":"table-bordered table-hover",
			"rows": [
				{
					"highlight":true,
					"colspan":"3",
					"cols":["structure of the score calculation"]
				},
				{
					"cols": ["[sum_of]","",""]
				},			
				{
					"cols": ["","[max_of]",""]
				},
				{
					"cols": ["","","description:basic"]
				},
				{
					"cols": ["","[max_of]",""]
				},
				{
					"cols": ["","","description:query"]
				},
				{
					"cols": ["","","title:query"]
				}
			]
		}
	],
	"nextSlide":"explaindismax"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"explaindismax",
	"title":"Explain dis_max query",
	"subTitle":"use tie breaker",
	"description":"Show the effect of a dis_max query which is a balance between cross_fields and best matching field.",
	"content": [
		{
			"type":"notification",
			"text":"GET /slides/_search?explain"
		},
		{
			"type":"code",
			"code": {
			  "query": {
			    "dis_max": {
			      "tie_breaker": 0.7,
			      "boost": 1.2,
			      "queries": [
			        {
			          "match": {
			            "description": "basic query"
			          }
			        },
			        {
			          "match": {
			            "title": "basic query"
			          }
			        }
			        ]
			    }
			  }
			}
		},
		{
			"type":"table",
			"class":"table-bordered table-hover",
			"rows": [
				{
					"highlight":true,
					"colspan":"4",
					"cols":["structure of the score calculation"]
				},
				{	
					"colspan":"2",
					"cols": ["[max_of + 0.7 [*] others]","",""]
				},			
				{
					"cols": ["","[+]","",""]
				},
				{
					"cols": ["","","description:basic",""]
				},
				{
					"cols": ["","","description:query",""]
				},
				{
					"cols": ["","[*]","",""]
				},
				{
					"cols": ["","","[+]",""]
				},
				{
					"cols": ["","","","title:query"]
				},
				{
					"cols": ["","","coord (1/2)",""]
				}				
			]
		}
	],
	"nextSlide":"multipletermsandfields"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"multipletermsandfields",
	"title":"Multile terms and fields",
	"subTitle":"summary",
	"description":"Explain the different options we have for multi field queries and explain the differences when calculating the score.",
	"content": [
		{
			"type":"list",
			"items": [
				{
					"showme":true,
					"text":"Best field returns the field with the highest score,"
				},
				{
					"showme":false,
					"text":"Most fields adds the scores for the different fields,"
				},
				{
					"showme":false,
					"text":"Cross fields treets all field as one big field and add maximum score for term,"
				},
				{
					"showme":false,
					"text":"Dis max takes the best field and adds a part of the score of other fields"
				}
			]
		}
	],
	"nextSlide":"boosting"
}'

# Denk toch dat ik deze slide wil opbreken, misschien plaatjes maken met deel van de score
# en deel van de query of zo. Vind het nog lastig.
curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"boosting",
	"title":"Boosting",
	"subTitle":"the basics",
	"description":"In match queries you can apply a boost to a certain field. Important to notice is that you cannot really change the output of explain. It is only the score that changes.",
	"content": [
		{
			"type":"code",
			"code": {
			  "query": {
			    "multi_match": {
			      "query": "basic query",
			      "fields": ["title^5","description"],
			      "type": "best_fields"
			    }
			  }
			}
		},
		{
			"type":"list",
			"items": [
				{
					"showme":true,
					"text":"Applied a boost of 5 to the title field,"
				},
				{
					"showme":false,
					"text":"score: with boost 0.3271296, without 0.71368325,"
				},
				{
					"showme":false,
					"text":"Not easy to detect, not visible as a product_of for instance,"
				},
				{
					"showme":false,
					"text":"We have to look at the queryNorm of description"
				}
			]
		}
	],
	"nextSlide":"questions"
}'

curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"questions",
	"title":"Questions",
	"subTitle":"I am here the whole day",
	"description":"If you have a question now or later.",
	"content": [
		{
			"type":"notification",
			"text":"Do you have questions?"
		}
	],
	"nextSlide":"boolquery"
}'


curl -s -XPOST 'http://localhost:9200/slides/slide' -d '
{
  "slideId":"boolquery",
	"title":"Bool query",
	"subTitle":"the base for all queries",
	"description":"Introduce the bool query as the base query to all other queries. In the end all queries can be written as a bool query. Explain the difference between operator AND/OR.",
	"content": [
		{
			"type":"code",
			"code": {
			  "query": {
			    "bool": {
			      "must": [
			        {}
			      ],
			      "must_not": [
			        {}
			      ],
			      "should": [
			        {}
			      ]
			    }
			  }
			}
		}
	],
	"nextSlide":"start"
}'

# Some ideas for next slides
# Don't forget the tie breaker and of course the boost, what is the impact to score
# What about signals, there are a lot but what do we mean with it, how does it infleunce the score.
# Check, I think the signals is one of the should queries that can have multiple signals.
# Have a look at the function_score query (dates and popularity)
# Create a reference section, also to the elasticsearch book
# I think a last slide that explain that tuning the results is cool, but often you do not really need it. Use instrumentation to check what people are doing with your search results.
