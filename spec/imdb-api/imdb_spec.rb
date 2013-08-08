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
  describe "Getting" do
    before :each do
      ImdbApi::Options.set(anonymize: true)
    end
    describe "top 250" do
      before :all do
        @top = ImdbApi::Imdb.top250
      end
      
      it "has 250 items" do
        expect(@top).to have(250).items
      end
      
      it "has 250 ImdbApi::Object s" do
        @top.each{|item| expect(item).to be_a ImdbApi::Object}
      end
      
      it "each item has a title" do
        @top.each{|item| expect(item.title).to  be_a String}
      end
        
      
    end
    
  end
  
end