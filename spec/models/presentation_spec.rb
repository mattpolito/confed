require File.dirname(__FILE__) + '/../spec_helper'

describe Presentation do
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:speaker_id).of_type(:integer) }

  it { should belong_to(:speaker) }
  it { should have_many(:videos) }
  it { should have_many(:slideshows) }

  let(:valid_attributes) do
    {
      :title => 'title',
      :description => 'description',
      :speaker_id => 1
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
  end

  describe "tagging" do
    subject{ Presentation.new }

    it{ should be_a_kind_of(ActsAsTaggableOn::Taggable::Core) }
    it{ should respond_to('tag_list') }
  end

  describe "requests and stores embed code from uri via an api" do
    let(:presentation) { Presentation.new(valid_attributes) }

    let(:request_uri) do
      "http://api.embed.ly/v1/api/oembed?urls=http://embeded_content_url_1.com/something,http://embeded_content_url_1.com/something_else"
    end

    let(:embeded_content_params) do
      [
        "http://embeded_content_url_1.com/something",
        "http://embeded_content_url_1.com/something_else"
      ]
    end

    let(:api_response) do
      HTTParty.get request_uri
    end
    
    before do
      @json_response = File.dirname(__FILE__) + "/../fixtures/presentations/embedly_response.json" 

      FakeWeb.register_uri(:get, request_uri, :body => @json_response )
    end

    describe "#request_embed_code" do
      it "returns and array of hash objects" do
        pending
        presentation.request_embed_code(embeded_content_params).should == @json_response
      end
    end
  end
end
