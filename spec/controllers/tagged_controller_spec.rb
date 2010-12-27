require 'spec_helper'

describe TaggedController do
  let(:presentation) { mock_model(Presentation) }

  describe "GET 'show'" do
    it "succeeds" do
      get :show, :tag_permalink => 'yabba'
      response.should be_success
    end

    it "sets variable to be used for the view" do
      Presentation.stub_chain(:released, :find_all_by_tag_permalink).and_return([presentation])
      get :show, :tag_permalink => 'yabba'
      assigns[:presentations].should == [presentation]
    end
  end

end
