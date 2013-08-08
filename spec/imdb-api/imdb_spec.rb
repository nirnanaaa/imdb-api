require 'spec_helper'

describe ImdbApi::Imdb do
  
  describe "URL building" do
    it "responds to build url" do
      expect(ImdbApi::Imdb).to respond_to :build_url
    end
    
    it "builds a basic request uri" do
      expect(ImdbApi::Imdb.build_url('/chart/top')).to match 'app.imdb.com'
    end
    
  end
  
end