#!/bin/bash

curl -s -w "\n" -XDELETE http://localhost:9200/blogging

curl -s -w "\n" -XPUT 'http://localhost:9200/blogging/data/1' -d '
{
  "title":"Elasticsearch is a nice search solution",
  "description":"In this blog post I am going to explain that elasticsearch is a very nice search solution",
  "tags":["elasticsearch","solution","search"],
  "popularity":5
}'

curl -s -w "\n" -XPUT 'http://localhost:9200/blogging/data/2' -d '
{
  "title":"Lucene is the search library",
  "description":"In this blog post we are going to explain the search library Lucene and why it is important for elasticsearch",
  "tags":["Lucene","library","search"],
  "popularity":3
}'

curl -s -w "\n" -XPUT 'http://localhost:9200/blogging/data/3' -d '
{
  "title":"JFall is a cool conference",
  "description":"During JFall (java) developers learn a lot about new technologies and about technologies that they used before",
  "tags":["conference","java"],
  "popularity":5
}'

curl -s -w "\n" -XPUT 'http://localhost:9200/blogging/data/4' -d '
{
  "title":"Jettro will present about elasticsearch at JFall",
  "description":"Jettro will present about getting the right results from elasticsearch.",
  "tags":["elasticsearch","JFall","right","results"],
  "popularity":3
}'
