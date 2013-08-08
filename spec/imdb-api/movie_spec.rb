require 'spec_helper'

describe ImdbApi::Movie do
  it "does" do
    movies = ImdbApi::Movie.search_exact("Goldeneye")
    movies.each do |movie|
      expect(ImdbApi::Movie.resolv_movie(movie)).to be_a ImdbApi::Object
    end
    
  end
end