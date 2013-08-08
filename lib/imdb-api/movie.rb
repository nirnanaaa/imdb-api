module ImdbApi
  
  class Movie
    class << self
      
      def search_exact(string, options = {})
        self.search_all(string, options).title_exact.map do |movie|
          Object.new(movie)
        end
      end
      
      def search_popular(string, options = {})
        self.search_all(string, options).title_popular.map do |movie|
          Object.new(movie)
        end
      end    
      
      def resolv_movie(movie)
        url = Imdb.build_url('/title/maindetails', :tconst => movie.id)
        result = Imdb.get(url)
        puts result
              #Movie.new(result["data"])
      end
        
      # Searches for all occurencies of given string
      #
      # string - Search query string
      # options - Options for ImdbApi::Options
      def search_all(string, options = {})
        Options.set(options) unless Options.initialized?
        opts = Options.options.title_params.merge(q: string)
        
        result = Imdb.get("http://www.imdb.com/xml/find", query: opts)
        ImdbApi::Object.new(JSON.parse(result))
        
      end 
      
      # == Aliasing
      alias_method :search, :search_all
      
    end
    
    def new(id)
      
    end
    
  end
  
end