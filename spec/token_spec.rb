require 'spec_helper'

describe Keen::Token do
  let(:api_key) { "ab428324dbdbcfe744" }
  let(:data) { {
   "filters" => [{
      "property_name" => "accountId",
      "operator" => "eq",
      "property_value" => "123456"
    }]
  }}
  let(:new_token) { Keen::Token.new(api_key, data) }

  describe "constructor" do
    it "should retain the api_key" do
      new_token.api_key.should == api_key
    end

    it "should retain the data" do
      new_token.data.should == data
    end
  end

  describe "encrypt! and decrypt!" do
    it "should encrypt and hex encode the data using the api key" do
      encrypted_str = new_token.encrypt!
      other_token = Keen::Token.decrypt!(api_key, encrypted_str)
      other_token.data.should == data
    end
  end
end
