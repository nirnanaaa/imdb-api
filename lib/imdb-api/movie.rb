module ImdbApi
  
  class Movie
    class << self
      
      # == Searches for Exact matches
      #
      # string - Search query string
      # options - Options for ImdbApi::Options
      #
      # Returns an array of Objects or just one 
      def search_exact(string, options = {})
        self.search_all(string, options).title_exact.map do |movie|
          Object.new(movie)
        end
      end
      
      # == Searches for Popular results
      #
      # string - Search query string
      # options - Options for ImdbApi::Options
      #
      # Returns an array of Objects or just one 
      def search_popular(string, options = {})
        self.search_all(string, options).title_popular.map do |movie|
          Object.new(movie)
        end
      end    
      
      # == Resolvs a Movie after the search or by ImdbApi::Object
      #
      # can be used after: search, search_all, search_exact, search_popular.
      #
      # Expects only ONE movie
      #
      # movie - Instance of Imdb::Object
      #
      # Returns either 1 movie or an array of movies
      def resolv_movie(movie)
        raise MovieNotFoundError unless movie.is_a?(ImdbApi::Object)
        url = Imdb.build_url('/title/maindetails', :tconst => movie.id)
        result = JSON.parse(Imdb.get(url))
        if result.is_a?(Array)
          return result.map{|movie| Object.new(movie)}     
        else
          return Object.new(result)
        end
      end
        
      # == Searches for all occurencies of given string
      #
      # string - Search query string
      # options - Options for ImdbApi::Options
      def search_all(string, options = {})
        Options.set(options) unless Options.initialized?
        opts = Options.options.title_params.merge(q: string)
        
        result = Imdb.get(Options.options.anonymize? ?  Options.options.anonymize_uri + Options.options.xml_find_uri : Options.options.xml_find_uri , query: opts)# does not work. Wrong content type
        Object.new(JSON.parse(result))
        
      end 
      
      # == Aliasing
      alias_method :search, :search_all
      
    end
    
  end
  
end