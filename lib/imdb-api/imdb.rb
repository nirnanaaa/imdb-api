module ImdbApi

  # == Main Class
  class Imdb
    class << self
      
      # == URL builder
      # 
      # Performs the transition from /some/path into http(s)://some.url/some/path
      def build_url(path, rparams = {},options = {})
        Options.set(options) unless Options.initialized?
        opts = Options.options
        query_param_array = []
        base_uri = URI.parse((opts.anonymize?) ?  opts.anonymize_uri+opts.base_uri : opts.base_uri)
        base_host = base_uri.host
        the_path = base_uri.path + path
        opts.request_params.merge(rparams).each_pair{|key, value| query_param_array << "#{key}=#{URI.escape(value.to_s)}" }
        uri = URI::HTTP.build(:scheme => 'https', :host => base_host, :path => the_path, :query => query_param_array.join("&"))
        query_param_array << "sig=app1-#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha1'), opts.request_params.apiKey, uri.to_s)}"
        uri = URI::HTTP.build(:scheme => 'https', :host => base_host, :path => the_path, :query => query_param_array.join("&"))
        uri.to_s
      end
      
      # == Gets an URL
      #
      # url - URL, builded with self.build_url
      # rparams - Last minute parameters
      # options - Optional options hash
      def get(url, rparams = {}, options = {})
        opts = Options.options
        Options.set(options) unless Options.initialized?
        query_param_array = []
        rparams[:query].each_pair{|key, value| query_param_array << "#{key}=#{URI.escape(value.to_s)}" } if rparams.has_key?(:query)
        conn = Faraday.new(:url => (opts.anonymize?) ?  opts.anonymize_uri+opts.base_uri : opts.base_uri) do |faraday|
          faraday.adapter  opts.faraday.adapter
        end
        conn.options.proxy = opts.faraday.proxy if opts.faraday.proxy?
        
        conn.get(query_builder(url, query_param_array)).body
      end
      
      # == Builds an URL query
      #
      # url - Base url(given)
      # parts - Array of Parameters
      def query_builder(url, parts)
        return url if parts.empty?
        return "#{url}&#{parts.join('&')}" if url.include?('?')
        return "#{url}/?#{parts.join('&')}"
      end
      
      # == Gets the 250 top films
      # JSON pre:
      # {:exp=>expires, :@meta=>{:serverTimeMs=>23, :requestId=>"id"}, :data=>{:list=>{:label=>"Top 250 movies as voted by our users", :list=> []
      #
      def top250_movies
        url = build_url('/chart/top')
        ImdbApi::Object.deserialize(get(url))
      end
      
      def top_shows
        url = build_url('/chart/tv')
        ImdbApi::Object.deserialize(get(url))
      end
      
    end
    
  end
  
end
