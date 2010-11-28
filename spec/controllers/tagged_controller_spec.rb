require 'spec_helper'

describe TaggedController do
  let(:presentation) { mock_model(Presentation) }

  describe "GET 'show'" do
    it "succeeds" do
      get :show, :tag_name => 'yabba'
      response.should be_success
    end

    it "sets variable to be used for the view" do
      Presentation.stub(:tagged_with).and_return([presentation])
      get :show, :tag_name => 'yabba'
      assigns[:presentations].should == [presentation]
    end
  end

end
