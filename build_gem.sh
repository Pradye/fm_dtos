#!/bin/sh

cd gem_source

./jbundle install --path ~/.gem

./jbundle exec rspec spec --format RspecJunitFormatter --out "../rspec.xml"
