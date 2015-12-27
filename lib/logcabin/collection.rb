module LogCabin
  ##
  # Define a collection of modules
  class Collection
    attr_reader :load_path

    def initialize(params = {})
      @load_path = params[:load_path] || fail('Load path must be provided')
      @load_path = [@load_path] if @load_path.is_a? String
      @modules = {}
    end

    ##
    # Method for finding modules to load
    def find(name)
      return @modules[name] if @modules[name]
      file = find_file(name)
      require file
      class_name = parse_class_name(name)
      @modules[name] = LogCabin::Modules.const_get(class_name)
    end

    private

    ##
    # Convert file name to class name
    # Borrowed with love from Homebrew: http://git.io/vEoDg
    def parse_class_name(name)
      class_name = name.to_s.capitalize
      class_name.gsub(/[-_.\s]([a-zA-Z0-9])/) { Regexp.last_match[1].upcase }
    end

    ##
    # Check module path for module
    def find_file(name)
      @load_path.each do |dir|
        file_path = File.join(dir, "#{name}.rb")
        return file_path if File.exist? file_path
      end
      fail("Module #{method} not found")
    end
  end
end
