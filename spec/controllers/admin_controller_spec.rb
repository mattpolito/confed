require File.dirname(__FILE__) + '/../spec_helper'

describe AdminController do
  let(:user) { mock_model(User) } 

  before do
    User.stub(:find).and_return(user)
    sign_in user
  end

  describe "GET index" do
    it "succeeds" do
      get :index
      response.should be_success
    end
  end
end

