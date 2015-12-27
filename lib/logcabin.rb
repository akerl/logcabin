##
# Support dynamic loading of modules at runtime
module LogCabin
  class << self
    ##
    # Insert a helper .new() method for creating a new Cache object

    def new(*args)
      self::Collection.new(*args)
    end
  end

  ##
  # Empty module for namespacing dynamic modules
  module Modules
  end
end

require 'logcabin/collection'
