require "./spec_helper"

describe Tunnelup::Client do
  describe "#api_key" do
    it "sets and gets it" do
      api_key = SecureRandom.hex
      client = Tunnelup::Client.new(api_key: api_key)
      client.api_key.should eq api_key
    end
  end

  describe "#get_subdomains" do
    context "success" do

    end

    context "unauthorized" do
      it "raises Tunnelup::UnauthorizedError" do
        FakeApi.stub_api_get_subdomains_unauthorized

        expect_raises Tunnelup::UnauthorizedError do
          FakeApi.client.get_subdomains
        end
      end
    end
  end

  describe "#get_current_user" do
    context "success" do
      it "returns a Tunnelup::User" do
        FakeApi.stub_api_get_user_success

        FakeApi.client.get_current_user.class.should eq Tunnelup::Models::User
      end
    end

    context "unauthorized" do
      it "raises Tunnelup::UnauthorizedError" do
        FakeApi.stub_api_get_user_unauthorized

        expect_raises Tunnelup::UnauthorizedError do
          FakeApi.client.get_current_user
        end
      end
    end
  end
end
