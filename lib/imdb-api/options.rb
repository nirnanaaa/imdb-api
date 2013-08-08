module ImdbApi
  class Options
    class << self
      
      # == Class variable
      attr_accessor :options
      
      # == Were the options already initialized?
      def initialized?
        @initialized ||= false
      end
    
      def defaults
        {
          base_uri: 'https://app.imdb.com',
          anonymize_uri: 'http://anonymouse.org/cgi-bin/anon-www.cgi/',
          anonymize: false,
          request_params: {
            api: "v1",
            appid: "iphone1_1", 
            apiPolicy: "app1_1", 
            apiKey: "2wex6aeu6a8q9e49k7sfvufd6rhh0n", 
            locale: 'en_US', 
            timestamp:  Time.now.to_i
          },
          title_params: {
            "json"=> "1", 
            nr: 1, 
            tt: "on"
          },
          faraday: {
            proxy: nil,
            adapter: Faraday.default_adapter
          }
        }
      end
      
      def set(options = {})
        @options = ImdbApi::Object.new(defaults.merge(options)) if options.is_a? Hash
        @initialized = true
      end
      
    end
    
  end
end