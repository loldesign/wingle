module ProcessSelectionManager
  class Base
    def initialize(options={})
      @owner   = options[:owner]
      @company = options[:company]
    end
  end
end
