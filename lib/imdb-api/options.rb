module ImdbApi
  class Options
    class << self
      
      # == Class variable
      attr_accessor :options
      
      
      def set(options = {})
        @options = ImdbApi::Object.new(options) if options.is_a? Hash
      end
      
    end
    
  end
end