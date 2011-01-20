require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PresentationsHelper. For example:
#
# describe PresentationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe PresentationsHelper do
  let(:presentation) { mock_model(Presentation, :title => "Some Topic") }

  describe "#tweet_text_for(presentation)" do
    let(:speaker) { mock_model(Speaker) }
    let(:speaker2) { mock_model(Speaker) }
    let(:event) { mock_model(Event, :name => "My Awesome Conference") }

    before do
      presentation.stub(:event).and_return(event)
    end

    describe "with speaker that has twitter handle" do
      it "returns string that includes twitter handle" do
        presentation.stub(:speakers).and_return([speaker])
        speaker.stub(:twitter?).and_return(true)
        speaker.stub(:twitter).and_return("speaker")
        string = helper.tweet_text_for(presentation)
        string.should == "Watching @speaker talk about Some Topic - My Awesome Conference"
      end
    end

    describe "with speakers that have twitter handles" do
      it "returns string that includes twitter handles" do
        presentation.stub(:speakers).and_return([speaker, speaker2])
        speaker.stub(:twitter?).and_return(true)
        speaker.stub(:twitter).and_return("speaker")
        speaker2.stub(:twitter?).and_return(true)
        speaker2.stub(:twitter).and_return("speaker2")
        string = helper.tweet_text_for(presentation)
        string.should == "Watching @speaker & @speaker2 talk about Some Topic - My Awesome Conference"
      end
    end

    describe "with one speaker that has a twitter and one does not" do
      it "returns string that includes twitter handle" do
        presentation.stub(:speakers).and_return([speaker, speaker2])
        speaker.stub(:twitter?).and_return(true)
        speaker.stub(:twitter).and_return("speaker")
        speaker2.stub(:twitter?).and_return(false)
        string = helper.tweet_text_for(presentation)
        string.should == "Watching @speaker talk about Some Topic - My Awesome Conference"
      end
    end

    describe "with speaker that does not have twitter handle" do
      it "returns string without a twitter handle" do
        presentation.stub(:speakers).and_return([speaker])
        speaker.stub(:twitter?).and_return(false)
        speaker.stub(:twitter).and_return("")
        string = helper.tweet_text_for(presentation)
        string.should == "Watching Some Topic - My Awesome Conference"
      end
    end
  end

  describe "#shorten_url_for(url, presentation)" do
    describe "when presentation already has shortened url" do
      it "returns Presentation#short_url" do
        presentation.stub(:short_url).and_return("short_url")
        presentation.stub(:short_url?).and_return(true)
        result = helper.shorten_url_for("long_url", presentation)
        result.should == "short_url"
      end
    end

    describe "when presentation has no shortened url" do
      it "returns Presentation#short_url" do
        presentation.stub(:set_short_url).and_return("short_url")
        presentation.stub(:short_url?).and_return(false)
        result = helper.shorten_url_for("long_url", presentation)
        result.should == "short_url"
      end

      it "calls Presentation#set_short_url(url)" do
        presentation.should_receive(:set_short_url).with("long_url")
        presentation.stub(:short_url?).and_return(false)
        result = helper.shorten_url_for("long_url", presentation)
      end
    end
  end
end
