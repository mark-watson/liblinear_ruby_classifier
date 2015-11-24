# Simple demo using liblinear-ruby-swig and libsvm_preprocessor for SVM text classification

Uses:   https://github.com/tomz/liblinear-ruby-swig

Install with: gem install tomz-liblinear-ruby-swig

Uses library for text to feature vectors: https://github.com/nodo/libsvm_preprocessor

Install with: gem install libsvm_preprocessor

and: gem install unicode

Note: if you have a blank line in the input file test.csv then this example will throw an error.

An intermediate file test.svm is written during processing that contains SVM feature vectors.
