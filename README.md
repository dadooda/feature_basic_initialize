
Feature::BasicInitialize
========================

Basic initializer for a class

Overview
--------

```ruby
require "feature/cache"

class Person
  Feature::BasicInitialize.load(self)

  attr_accessor :name, :age
end

Person.new(name: "Joe", age: 29)
```

Full documentation is available at [rubydoc.info](http://www.rubydoc.info/github/dadooda/feature_basic_initialize/Feature/BasicInitialize).


Setup
-----

This project is a *sub*. Sub setup example is available [here](https://github.com/dadooda/subs#setup).

For more info on subs, click [here](https://github.com/dadooda/subs).


Cheers!
-------

&mdash; Alex Fortuna, &copy; 2015
