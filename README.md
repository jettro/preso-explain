preso-explain
=============

format of slide
===============
title
subTitle
content [
	type
	text or rows
]
description

Mapping
=======
DELETE /slides
PUT /slides
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
}

POST /slides/slide
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
}

POST /slides/slide
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
}

POST /slides/slide
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
  "nextSlide":"start"
}