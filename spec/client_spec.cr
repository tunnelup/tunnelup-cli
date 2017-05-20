require "./spec_helper"

describe Tunnelup::Client do
  describe "#api_key" do
    it "sets and gets it" do
      api_key = SecureRandom.hex
      client = Tunnelup::Client.new(api_key: api_key)
      client.api_key.should eq api_key
    end
  end

  describe "#login" do
    context "success" do
      it "returns Tunnelup::Models::User" do
        FakeApi.stub_api_login_success

        user = Tunnelup::Client.login(
          email: "georgedrummond@gmail.com",
          password: "password"
        )

        user.class.should eq Tunnelup::Models::User
      end
    end

    context "failure" do
      it "raises Tunnelup::UnauthorizedError" do
        FakeApi.stub_api_login_failure

        expect_raises Tunnelup::UnauthorizedError do
          Tunnelup::Client.login(
            email: "georgedrummond@gmail.com",
            password: "password"
          )
        end
      end
    end
  end

  describe "#signup" do
    context "success" do
      FakeApi.stub_api_signup_success

      user = Tunnelup::Client.signup(
        email: "georgedrummond@gmail.com",
        password: "password"
      )

      user.class.should eq Tunnelup::Models::User
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
      it "returns a Tunnelup::Models::User" do
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
