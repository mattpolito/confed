require 'spec_helper'

describe SitemapController do
  describe "GET show" do
    describe "with XML" do
      it "succeeds" do
        pending "not finding the route from the spec"
        get :show, :format => :xml
        response.shoud be_success
      end
    end
  end
end
