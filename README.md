# NaiveBayesRb

A very simple Ruby implementation of Naive Bayes classification model. 

## Design Considerations

1. the interface closely resembles the python [scikit-learn interface].
2. enable model serialization and persistence, so that the model can be reused and even distributed and shared. With the default `MarshalSerializer`, it also allows custom serializer to be plugged in.

[scikit-learn interface]: http://scikit-learn.org/stable/modules/classes.html#module-sklearn.naive_bayes

## Usage

### basics

```ruby
nb = NaiveBayesRb::NaiveBayes.new
train = [[1, 20], [2, 21], [3, 22], [4, 23]] 
target = [1, 0, 1, 0] 
test = [[0, 0], [4, 24]]
nb.fit(train, target).predict(test) #=> [1, 0] 
```
### Model Persistence

```ruby
NaiveBayesRb::NaiveBayes.serializer =       
nb = NaiveBayesRb::NaiveBayes.new
nb.fit(train, target).save('model.pb')
```

### Loading Persisted Model

```ruby
NaiveBayesRb::NaiveBayes.serializer =       
nb = NaiveBayesRb::NaiveBayes.load('model.pb')
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'naive_bayes_rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install naive_bayes_rb

## Thanks


