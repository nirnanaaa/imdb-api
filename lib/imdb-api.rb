
# Externals
require 'json'
require 'open-uri'

module ImdbApi
  
  # == IMDB Api version String
  VERSION = '0.0.1'
  
  # == Custom Error if a movie was not found
  class MovieNotFoundError < StandardError; end
  
end

require 'imdb-api/imdb'
require 'imdb-api/movie'
require 'imdb-api/shows'