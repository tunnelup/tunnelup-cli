require "./spec_helper"

describe Tunnelup do
  it "works" do
    client = Tunnelup::Client.new("helllo")
    client.api_key.should eq("helllo")
  end
end
