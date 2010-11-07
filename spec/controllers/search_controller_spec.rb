require File.dirname(__FILE__) + '/../spec_helper'

describe SearchController do

  describe "GET search" do
    context "search query provided" do
      it "is successful" do
        get :search, :q => "foo"
        response.should be_success
      end

      it "searchs for presentations matching the query" do
        Presentation.should_receive(:search).with("foo*")
        get :search, :q => "foo"
      end

      it "searchs for speakers matching the query" do
        Speaker.should_receive(:search).with("foo*")
        get :search, :q => "foo"
      end
    end

    context "no search query provided" do
      it "redirects back to the homepage" do
        get :search
        response.should redirect_to("/")
      end
    end
  end

end
