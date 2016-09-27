logcabin
=========

[![Gem Version](https://img.shields.io/gem/v/logcabin.svg)](https://rubygems.org/gems/logcabin)
[![Dependency Status](https://img.shields.io/gemnasium/akerl/logcabin.svg)](https://gemnasium.com/akerl/logcabin)
[![Build Status](https://img.shields.io/circleci/project/akerl/logcabin/master.svg)](https://circleci.com/gh/akerl/logcabin)
[![Coverage Status](https://img.shields.io/codecov/c/github/akerl/logcabin.svg)](https://codecov.io/github/akerl/logcabin)
[![Code Quality](https://img.shields.io/codacy/d1bda1c1e77f4f65b600ba93300ca22d.svg)](https://www.codacy.com/app/akerl/logcabin)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Support dynamic loading of modules at runtime

## Usage

Create a collection of modules with `collection = LogCabin.new(load_path: '/path/to/modules')`.

You can also pass in an array of paths as load_path.

You can then load a module and return it with `collection.find(:module_name)` (you can use a string or symbol for the name).

Modules should be children of LogCabin::Modules, like so:

```
module LogCabin
  module Modules
    module MyDynamicModule
      def useful_function
        puts "Hello world"
      end
    end
  end
end
```

This should go in the file "my_dynamic_module.rb", and would be loaded with `collection.find(:my_dynamic_module)`. This naming convention is required for modules, where an underscore in the filename matches with a capitalized letter in the module definition.

As an example usage, you can use LogCabin to dynamically extend instances of a class:

```
COLLECTION = LogCabin.new(load_path: '/path/to/my/dynamic/module')

class BoringClass
  def initialize(cool_module)
    extend COLLECTION.find(cool_module)
  end
end

x = BoringClass.new('my_dynamic_module')
x.useful_function >> puts "Hello World"
```

## Installation

    gem install logcabin

## License

logcabin is released under the MIT License. See the bundled LICENSE file for details.

