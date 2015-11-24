require "libsvm_preprocessor/preprocessor"
require 'linear'
require 'csv'

# Input file: test1.csv. An intermediate file test1.svm (containing features) is created.

# default is tab delimited spreadsheet column data, to override:
#::LibsvmPreprocessor::CSV_OPTIONS = {:col_sep=>",", :headers=>false}

preprocessor = Preprocessor.new() # numeric_type: 2)
preprocessor.use("test1.csv", "test1.svm")

all_text = []
File.open('test1.csv').each do |line|
  all_text << line
end

training_labels = []
training_maps = []
training_text = []
testing_maps = []
testing_labels = []
testing_text = []

count = 0
File.open('test1.svm').each do |line|
  index = line.index(" ")
  cls = line[0..index].to_i
  text = line[index..-1].strip.split
  #p cls
  #p text
  map = {}
  text.each {|x| a = x.split(':'); map[a[0].to_i] = a[1].to_i}
  #p map
  if rand < 0.7
    training_labels << cls
    training_maps << map
    training_text << all_text[count]
  else
    testing_labels << cls
    testing_maps << map
    testing_text << all_text[count]
  end
  count += 1
end

if false
  p training_labels
  p training_maps
  p testing_labels
  p testing_maps
  p "\n\n-----\n"
end

sp = LProblem.new(training_labels, training_maps, 1) # bias of 1
pa = LParameter.new
pa.solver_type = MCSVM_CS 
pa.eps = 0.1

model = LModel.new(sp, pa)

correct = 0

for i in 0...testing_labels.size
  cls = testing_labels[i]
  maps = testing_maps[i]
  prediction = model.predict(maps)
  puts "gold: #{cls}\tprediction: #{prediction}\toriginal data: #{testing_text[i]}"
  correct += 1 if cls == prediction
end

puts "\nPercent correctly classified: #{((correct.to_f / testing_labels.size) * 100).to_i}"

