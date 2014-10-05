#!/bin/bash

curl -s -XDELETE http://localhost:9200/onetwothree

curl -s -XPUT 'http://localhost:9200/onetwothree' -d '
{
  "settings": {
    "analysis": {
      "analyzer": {
        "camel": {
          "type": "pattern",
          "pattern": "([^\\p{L}\\d]+) | (?<=[ \\p{L} && [^\\p{Lu}]])(?=\\p{Lu})"
        }
      }
    }
  },
  "mappings": {
    "data": {
      "properties": {
        "title": {
          "type": "string",
          "search_analyzer": "camel"
        }
      }
    }
  }
}'

curl -s -XPUT 'http://localhost:9200/onetwothree/data/1' -d '
{
  "title":"one two three"
}'

curl -s -XPUT 'http://localhost:9200/onetwothree/data/2' -d '
{
  "title":"two three"
}'

curl -s -XPUT 'http://localhost:9200/onetwothree/data/3' -d '
{
  "title":"three"
}'

