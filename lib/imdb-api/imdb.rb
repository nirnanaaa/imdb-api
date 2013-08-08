module ImdbApi

  # == Main Class
  class Imdb
    class << self
      
      # == URL builder
      # 
      # Performs the transition from /some/path into http(s)://some.url/some/path
      def build_url(path)
        default_params = {"api" => "v1", "appid" => "iphone1_1", "apiPolicy" => "app1_1", "apiKey" => "2wex6aeu6a8q9e49k7sfvufd6rhh0n", "locale" => "en_US", "timestamp" => Time.now.to_i}
        query_param_array = []
        base_uri = URI.parse(BASE_URI)
        base_host = base_uri.host
        the_path = base_uri.path + path
        default_params.each_pair{|key, value| query_param_array << "#{key}=#{URI.escape(value.to_s)}" }
        uri = URI::HTTP.build(:scheme => 'https', :host => base_host, :path => the_path, :query => query_param_array.join("&"))
        query_param_array << "sig=app1-#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha1'), default_params["apiKey"], uri.to_s)}"
        uri = URI::HTTP.build(:scheme => 'https', :host => base_host, :path => the_path, :query => query_param_array.join("&"))
        uri.to_s
      end
      
    end
    
  end
  
end
