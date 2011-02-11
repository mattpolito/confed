require 'spec_helper'

describe ApplicationHelper do
  describe "meta content helpers" do
    describe "for page title" do
      describe "#meta_content_for(:title) {}" do
        it "stores a value passed" do
          helper.content_for(:meta_title).should_not be_present
          helper.meta_content_for(:title) { "HELLO" }
          helper.content_for(:meta_title).should be_present
        end
      end

      describe "#displayed_page_title" do
        it "outputs complete page title content" do
          helper.content_for(:meta_title) { "HELLO" }
          helper.displayed_page_title.should == "HELLO - Confed"
        end

        it "outputs default string if none provided" do
          AppConfig.stub(:default_page_title).and_return("Confed")
          helper.displayed_page_title.should == "Confed"
        end
      end
    end
    
    describe "for meta description" do
      describe "#meta_content_for(:description) {}" do
        it "stores a value passed" do
          helper.content_for(:meta_description).should_not be_present
          helper.meta_content_for(:description) { "HELLO" }
          helper.content_for(:meta_description).should be_present
        end
      end

      describe "#displayed_meta_description" do
        it "outputs complete meta description content" do
          helper.meta_content_for(:description) { "HELLO" }
          helper.displayed_meta_description.should == "HELLO"
        end

        it "truncates output at 155 chars" do
          helper.meta_content_for(:description) { "A" * 160 }
          helper.displayed_meta_description.size.should == 155
        end

        it "outputs default string if none provided" do
          AppConfig.stub(:default_meta_description).and_return("I LOVE IT")
          helper.displayed_meta_description.should == "I LOVE IT"
        end
      end
    end

    describe "for meta keywords" do
      describe "#meta_content_for(:keywords) {}" do
        it "stores a value passed" do
          helper.content_for(:meta_keywords).should_not be_present
          helper.meta_content_for(:keywords) { "keyword1, keyword2" }
          helper.content_for(:meta_keywords).should be_present
        end
      end

      describe "#displayed_meta_keywords" do
        it "outputs complete meta keywords content" do
          helper.meta_content_for(:keywords) { "keyword1, keyword2" }
          helper.displayed_meta_keywords.should == "keyword1, keyword2"
        end

        it "outputs default string if none provided" do
          AppConfig.stub(:default_meta_keywords).and_return("some1, some12")
          helper.displayed_meta_keywords.should == "some1, some12"
        end
      end
    end
  end

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

