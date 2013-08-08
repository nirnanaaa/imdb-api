require 'spec_helper'

describe ImdbApi::Movie do
  it "does" do
    movies = ImdbApi::Movie.search_exact("Goldeneye")
    movies.each do |movie|
      ImdbApi::Movie.resolv_movie(movie)
    end
    
  end
end