require 'spec_helper'

describe ImdbApi do
  
  it "has a version" do
    expect(ImdbApi::VERSION).to be_a String
  end
  
  it "has a base uri" do
    expect(ImdbApi::BASE_URI).to be_a String
  end
  
  it "has 2 Dots" do
    expect(ImdbApi::VERSION.count('.')).to be(2)
  end

  it "can raise the MovieNotFoundError" do
    expect{raise ImdbApi::MovieNotFoundError}.to raise_error
  end
  
end