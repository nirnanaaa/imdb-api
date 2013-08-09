require 'spec_helper'

describe ImdbApi::Object do
  
  it "detects invalid json input" do
    expect(ImdbApi::Object.valid_json?('[{"first": "true"} {"first": "false"}])')).to be_false
  end
  
  it "detects valid json input" do
    expect(ImdbApi::Object.valid_json?('{"first": "true"}')).to be_true
  end
  
end