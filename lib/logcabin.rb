##
# Support dynamic loading of modules at runtime
module LogCabin
  class << self
    ##
    # Insert a helper .new() method for creating a new Cache object

    def new(*args)
      self::DirCollection.new(*args)
    end
  end

  ##
  # Empty module for namespacing dynamic modules
  module Modules
  end

  ##
  # Basic collection object for subclassing
  class BaseCollection
    def initialize(_)
      @modules = {}
    end

    private

    def cache(name)
      @modules[name] ||= yield
    end

    def load_class_from_module(mod_name, name)
      require mod_name
      class_name = parse_class_name(name)
      LogCabin::Modules.const_get(class_name)
    rescue LoadError
      raise("Error while loading #{mod_name} / #{class_name}")
    end

    ##
    # Convert file name to class name
    # Borrowed with love from Homebrew: http://git.io/vEoDg
    def parse_class_name(name)
      class_name = name.to_s.capitalize
      class_name.gsub(/[-_.\s]([a-zA-Z0-9])/) { Regexp.last_match[1].upcase }
    end
  end
end

require 'logcabin/dircollection'
require 'logcabin/gemcollection'
require 'logcabin/setcollection'
