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

The file test1.csv is tiny: it just includes 16 examples for 2 classifications (or categories). For practical applications the more training data the better. The results with the small test1.csv file will not be excellent, but when I use this model with many training examples the accuracy is usually > 90%, depending on your data and how many classes you are training.

About 30% of the input data is set aside for testing the trained model.

## API for calling the model

The following **irb** session shows how to cll the trained model:

````````
✗ irb
2.2.1 :001 > load './liblinear_ruby_classifier.rb'

gold: 0	prediction: 0	original data: EDUCATION	The students turned in their homework at school before summer break.
gold: 0	prediction: 0	original data: EDUCATION	The students and teachers agreed on a plan for study.
gold: 1	prediction: 1	original data: HEALTH	The hospital has 215 patients, 10 doctors, and 22 nurses.

Percent correctly classified: 100
 => true 
2.2.1 :002 > SVMclassifier "the teacher said no homework for the student"
 => "EDUCATION" 
2.2.1 :003 > 
````````

When the file liblinear_ruby_classifier.rb is loaded it trains a model on about 70% of the data and then tests the model using the other 30% of the original data. The output after loading this file shows the results of predicting the classification (category) of the test data.

After a model is trained then use the method **SVMclassifier** to classify new text.