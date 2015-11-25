# Simple demo using liblinear-ruby-swig and libsvm_preprocessor for SVM text classification

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
