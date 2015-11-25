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

## API for calling the model

The following **irb** session shows how to cll the trained model:

````````
✗ irb
2.2.1 :001 > load './liblinear_ruby_classifier.rb'

gold: 0	prediction: 0	original data: EDUCATION	The students turned in their homework at school before summer break.
gold: 1	prediction: 1	original data: HEALTH	The doctor and the nurse advised be to get rest because of my cold.
gold: 1	prediction: 1	original data: HEALTH	The doctor had to go to the hospital.
gold: 0	prediction: 0	original data: EDUCATION	The student lost her homework.
gold: 1	prediction: 1	original data: HEALTH	The cold and flu season started this month.
gold: 0	prediction: 1	original data: EDUCATION	The teacher yelled at the student who was late to class but later apologized.

Percent correctly classified: 83
 => true 
2.2.1 :002 > SVMclassifier "the teacher said no homework for the student"
 => "EDUCATION" 
2.2.1 :004 > 
````````

