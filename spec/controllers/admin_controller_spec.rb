require File.dirname(__FILE__) + '/../spec_helper'

describe AdminController do
  let(:user) { mock_model(User) } 

  describe "with authenticated admin" do
    before do
      User.stub(:find).and_return(user)
      user.stub(:has_role?).with(:admin).and_return(true)
      sign_in user
    end

    describe "GET index" do
      it "succeeds" do
        get :index
        response.should be_success
      end
    end
  end

  describe "with unauthenticated user" do
    before do
      User.stub(:find).and_return(nil)
    end

    describe "GET index" do
      it "redirects" do
        get :index
        response.should be_redirect
      end
    end
  end

  describe "with authenticated regular user" do
    before do
      User.stub(:find).and_return(user)
      user.stub(:has_role?).with(:admin).and_return(false)
      sign_in user
    end

    describe "GET index" do
      it "redirects" do
        get :index
        response.should be_redirect
      end
    end
  end
end

