module LogCabin
  ##
  # Define a collection of modules in a local dir
  class DirCollection < BaseCollection
    attr_reader :load_path

    def initialize(params = {})
      @load_path = params[:load_path] || raise('Load path must be provided')
      @load_path = [@load_path] if @load_path.is_a? String
      super
    end

    ##
    # Method for finding modules to load
    def find(name)
      cache(name) { load_class_from_module(find_file(name), name) }
    end

    private

    ##
    # Check module path for module
    def find_file(name)
      @load_path.each do |dir|
        file_path = File.join(dir, "#{name}.rb")
        return file_path if File.exist? file_path
      end
      raise("Module #{name} not found")
    end
  end
end
