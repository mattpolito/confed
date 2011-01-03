require 'spec_helper'

describe TaggedController do
  let(:presentation) { mock_model(Presentation, :created_at => '') }

  describe "GET 'show'" do
    it "sets variable to be used for the view" do
      Presentation.stub_chain(:released, :find_all_by_tag_permalink).and_return([presentation])
      get :show, :tag_permalink => 'yabba'
      assigns[:presentations].should == [presentation]
    end

    describe "when HTML" do
      it "succeeds" do
        get :show, :tag_permalink => 'yabba'
        response.should be_success
      end
    end

    describe "when RSS" do
      it "redirects" do
        get :show, :tag_permalink => 'yabba', :format => :rss
        response.should be_redirect
      end

      it "returns a moved permanently response code" do
        get :show, :tag_permalink => 'yabba', :format => :rss
        response.status.should == 301
        response.status_message.should == "Moved Permanently"
      end
    end

    describe "when ATOM" do
      it "succeeds" do
        Presentation.stub_chain(:released, :find_all_by_tag_permalink).and_return([presentation])
        get :show, :tag_permalink => 'yabba', :format => :atom
        response.should be_success
      end
    end
  end

end
