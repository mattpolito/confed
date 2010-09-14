require 'spec_helper'

describe ExternalEmbed do
  it { should have_db_column(:url).of_type(:string).with_options(:null => false) }
  it { should have_db_column(:content).of_type(:text).with_options(:null => false) }
  it { should have_db_column(:presentation_id).of_type(:integer).with_options(:null => false) }
  it { should have_db_column(:type).of_type(:string).with_options(:null => false) }

  it { should belong_to(:presentation) }

  let(:valid_attributes) do
    {
      :presentation_id => 1,
      :type            => 'Video',
      :url             => 'http://vimeo.com/12224199',
      :content         => "<object type=\"application/x-shockwave-flash\" data=\"http://vimeo.com/moogaloop.swf\" width=\"320\" height=\"240\"><param name=\"allowscriptaccess\" value=\"always\"><param name=\"allowfullscreen\" value=\"true\"><param name=\"movie\" value=\"http://vimeo.com/moogaloop.swf\"><param name=\"flashvars\" value=\"clip_id=12224199&color=00adef&fullscreen=1&server=vimeo.com&show_byline=1&show_portrait=1&show_title=1\"></object>"
    }
  end

  describe "when instantiating" do
    describe "with valid attributes" do
      subject { ExternalEmbed.new(valid_attributes) }

      it "creates a new object instance" do
        subject.should be_valid
      end
    end

    describe "with invalid attributes" do
      subject { ExternalEmbed.new }

      it { should have(1).error_on(:url) }
      it { should have(1).error_on(:content) }
      it { should have(2).error_on(:presentation_id) }
    end
  end
end
