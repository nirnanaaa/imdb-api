
# Externals
require 'json'
require 'open-uri'
require 'hashr'
require 'faraday'

# == IMDB Api module definition
#
#
# URL schemes:
# Anonymization Service: anonymouse.org/cgi-bin/anon-www.cgi/
# as IMDB bans IP's very fast
#
# Base URL: https://app.imdb.com
#
# Find URL: http://www.imdb.com/xml/find
#
#
module ImdbApi
  
  BASE_URI = 'http://anonymouse.org/cgi-bin/anon-www.cgi/https://app.imdb.com'
  
  # == IMDB Api version String
  VERSION = '0.0.1'
  
  # == Custom Error if a movie was not found
  class MovieNotFoundError < StandardError; end
  
  # == Parsing Error
  class InvalidDataError < StandardError; end
  
end

require 'imdb-api/object'
require 'imdb-api/options'
require 'imdb-api/imdb'
require 'imdb-api/movie'
require 'imdb-api/series'