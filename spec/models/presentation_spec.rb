require File.dirname(__FILE__) + '/../spec_helper'

describe Presentation do
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:speaker_id).of_type(:integer) }
  it { should have_db_column(:tag_cache).of_type(:string) }
  it { should have_db_column(:event_id).of_type(:integer) }

  it { should belong_to(:event) }
  it { should belong_to(:speaker) }
  it { should have_many(:videos) }
  it { should have_many(:slideshows) }

  let(:valid_attributes) do
    {
      :title       => 'title',
      :description => 'description',
      :speaker_id  => 1,
      :event_id    => 1
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
    it { should have(2).errors_on(:speaker_id) }
    it { should have(2).errors_on(:event_id) }
  end

  describe "tagging" do
    subject{ Presentation.new }

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

  describe '#thumbnail' do
    subject{ Presentation.new } 

    it 'returns path for image' do
      subject.stub_chain(:videos, :first, :thumbnail).and_return("thumbnail_image")
      subject.thumbnail == "thumbnail_image"
    end

    it 'returns empty string when thumbnail is not available' do
      subject.thumbnail.should be_blank
    end
  end
end
