module LogCabin
  ##
  # Define a Set of collections, which attempts to load from each one before
  # failing
  class SetCollection < BaseCollection
    def initialize(params = {})
      @children = params[:children] || raise('Children must be specified')
      super
    end

    ##
    # Method for finding modules to load
    def find(name)
      cache(name) { @children.find { |x| safe_find(x, name) } || failure }
    end

    def failure
      raise('No match found in SetCollection')
    end

    private

    def safe_find(child, name)
      child.find(name)
    rescue
      nil
    end
  end
end
