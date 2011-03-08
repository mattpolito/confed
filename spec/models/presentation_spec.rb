require File.dirname(__FILE__) + '/../spec_helper'

describe Presentation do
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:speaker_id).of_type(:integer) }
  it { should have_db_column(:tag_cache).of_type(:string) }
  it { should have_db_column(:speaker_cache).of_type(:string) }
  it { should have_db_column(:event_cache).of_type(:string) }
  it { should have_db_column(:event_id).of_type(:integer) }
  it { should have_db_column(:released).of_type(:boolean) }
  it { should_not have_db_column(:event_name) }

  it { should belong_to(:event) }
  it { should have_and_belong_to_many(:speakers) }
  it { should have_many(:videos) }
  it { should have_many(:slideshows) }
  it { should have_many(:saved_presentations) }

  let(:valid_attributes) do
    {
      :title       => 'title',
      :description => 'description',
      :speaker_id  => 1,
      :event_id    => 1,
      :released    => false
    }
  end

  describe "instantiating a new object with valid attributes" do
    subject { Presentation.new(valid_attributes) }

    it "creates a new instance" do
      subject.should be_valid
    end
  end

  describe "instantiating a new object with no attributes" do
    subject { Presentation.new }

    it { should have(1).error_on(:title) }
    it { should have(2).errors_on(:event_id) }
    it { should_not be_released }
    it { should be_unreleased }
  end

  describe "scopes" do
    before do
      [true, false].each do |state|
        Factory(:presentation, :released => state)
      end
    end

    describe ".released" do
      it "returns records where #released == true" do
        Presentation.released.size.should == 1
      end
    end

    describe ".unreleased" do
      it "returns records where #released == false" do
        Presentation.unreleased.size.should == 1
      end
    end
  end

  describe "tagging" do
    subject { Factory.build(:presentation) }

    it{ should be_a_kind_of(ActsAsTaggableOn::Taggable::Core) }
    it{ should respond_to('tag_list') }

    describe 'tag cache' do
      it 'updates a tag cache on save' do
        subject.attributes = valid_attributes
        subject.tag_list = "foo, bar"
        subject.save!
        subject.tag_cache.should == "foo, bar"
        subject.tag_list = "foo, baz"
        subject.save!
        subject.tag_cache.should == "foo, baz"
      end
    end
  end

  describe "cache_columns" do
    subject { Factory.build(:presentation) }

    describe "for event name" do
      it 'updates the event_cache column with event name' do
        subject.event.name.should == "My Awesome Conference"
        subject.event_cache.should be_nil
        subject.save!
        subject.event_cache.should == "My Awesome Conference"
      end
    end

    describe "for speaker name" do
      describe "with one speaker" do
        it 'updates the speaker_cache column with speaker name' do
          subject.speaker_cache.should be_nil
          subject.save!
          subject.speaker_cache.should == "jeffrey lebowski"
        end
      end

      describe "with many speakers" do
        subject { Factory.build(:presentation_with_speakers) }

        it 'updates the speaker_cache column with speakers names' do
          subject.speaker_cache.should be_nil
          subject.save!
          subject.speaker_cache.should == "jeffrey lebowski, donny kerabatsos"
        end
      end
    end
  end

  describe '#thumbnail' do
    subject { Presentation.new } 

    it 'returns path for image' do
      subject.stub_chain(:videos, :first, :thumbnail).and_return("thumbnail_image")
      subject.thumbnail == "thumbnail_image"
    end

    it 'returns empty string when thumbnail is not available' do
      subject.thumbnail.should be_blank
    end
  end

  describe 'rendering description from text/markdown to html' do
    describe "when description is present" do
      subject { Factory(:presentation) }

      it "happens when saved" do
        subject.rendered_description.should == "<p>Description</p>\n"
      end
    end

    describe "when description is not present" do
      subject { Factory(:presentation, :description => nil) }

      it "doesn't get processed" do
        subject.rendered_description.should be_blank 
      end
    end
  end

  describe "#set_short_url(url)" do
    subject { Factory(:presentation) }
    let(:bitly) { mock(Bitly) }

    before do
      Bitly.stub(:new).and_return(bitly)
      bitly.stub_chain(:shorten, :short_url).and_return("short_url")
    end

    it "returns shortened version of url" do
      subject.set_short_url("long_url").should == "short_url"
    end

    it "saves shortened url to #short_url" do
      subject.set_short_url("long_url")
      subject.short_url.should == "short_url"
    end
  end

  describe "#queued_by?(current_user)" do
    subject { Factory(:presentation) }
    let(:user) { Factory(:user) }

    it "returns true if current_user has presentation in watch list" do
      user.watch_list.create(:presentation => subject)
      subject.queued_by?(user).should be_true
    end

    it "returns false unless current_user has presentation in watch list" do 
      subject.queued_by?(user).should be_false
    end
  end
end
