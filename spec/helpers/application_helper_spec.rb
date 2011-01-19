require 'spec_helper'

describe ApplicationHelper do
  describe "#active_class" do
    before do
      controller.request.stub(:path).and_return('/some_path')
    end

    describe "when path passed matches current url" do
      it "returns active" do
        helper.active_class('/some_path').should == 'active'
      end
    end

    describe "when path passed matches a portion of current url" do
      it "returns active" do
        controller.request.stub(:path).and_return('/some_path/action')
        helper.active_class('/some_path').should == 'active'
      end
    end
    
    describe "when path passed does not match current url" do
      it "returns nil" do
        helper.active_class('/some_other_path').should be_nil
      end
    end
  end

  describe "#avatar_url(user)" do
    let(:user) { mock_model(User) }

    describe "when user has twitter" do
      it "returns twitter avatar image uri" do
        user.stub(:twitter).and_return('mattpolito')
        user.stub(:twitter?).and_return(true)
        Twitter.stub(:profile_image).and_return("twitter_avatar_uri")
        string = helper.avatar_url(user) 
        string.should == "twitter_avatar_uri"
      end
    end

    describe "when user has email" do
      it "returns gravatar image uri" do
        user.stub(:twitter?).and_return(false)
        user.stub(:email).and_return('matt@example.com')
        Digest::MD5.stub(:hexdigest).and_return("hash")
        string = helper.avatar_url(user) 
        string.should match(/http\:\/\/gravatar\.com\/avatar\/hash\.png/)
      end
    end
  end
end

