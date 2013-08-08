require 'spec_helper'

describe ImdbApi::Options do
  before :each do
    ImdbApi::Options.set({})
  end
  
  it "should respond to options" do
    expect(ImdbApi::Options).to respond_to(:options)
  end
  
  it "should not be nil" do
    expect(ImdbApi::Options.options).not_to be_nil
  end
  
  [:base_uri, :anonymize_uri, :anonymize, :faraday].each do |item|
    it "responds to #{item}" do
      expect(ImdbApi::Options.options).to respond_to(item)
    end
  end
  
end