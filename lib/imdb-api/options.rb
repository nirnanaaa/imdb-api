module ImdbApi
  class Options
    class << self
      
      # == Class variable
      attr_accessor :options
      
      def defaults
        {
          base_uri: 'https://app.imdb.com',
          anonymize_uri: 'http://anonymouse.org/cgi-bin/anon-www.cgi/',
          anonymize: false
        }
      end
      
      def set(options = {})
        @options = ImdbApi::Object.new(defaults.merge(options)) if options.is_a? Hash
      end
      
    end
    
  end
end