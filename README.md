# Simple demo using liblinear-ruby-swig and libsvm_preprocessor for SVM text classification

Copyright 2015 [Mark Watson](http://www.markwatson.com)

Apache 2 License

## 3rd party gem libraries

https://github.com/tomz/liblinear-ruby-swig

https://github.com/nodo/libsvm_preprocessor

unicode

## Installation

bundle install

## Running

Use the tiny test file test.csv:

        bundle exec ruby liblinear_ruby_classifier.rb

To use another input file, for example stocks.csv:

        bundle exec ruby liblinear_ruby_classifier.rb stocks.csv


Note: if you have an empty (blank) line in the input file then this example will throw an error.

An intermediate file with the suffix ".svm" is written during processing that contains SVM feature vectors.

## Model accuracy

The file test1.csv is tiny: it just includes 16 examples for 2 classifications (or categries). For practical applications the more training data the better.

About 30% of the input data is set aside for testing the trained model.
