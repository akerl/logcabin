module LogCabin
  ##
  # Define a collection of modules in separate gems
  class GemCollection < BaseCollection
    def initialize(params = {})
      @prefix = params[:prefix] || raise('Gem prefix must be provided')
      super
    end

    ##
    # Method for finding modules to load
    def find(name)
      cache(name) { load_class_from_module("#{@prefix}-#{name}", name) }
    end
  end
end
