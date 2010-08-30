require 'spec_helper'

describe Presentation do
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:speaker_id).of_type(:integer) }

  it { should belong_to(:speaker) }

  before(:each) do
    @valid_attributes = {
      :title => 'title',
      :description => 'description',
      :speaker_id => 1
    }
  end

  describe "instantiating a new object with valid attributes" do
    subject { Presentation.new(@valid_attributes) }

    it "creates a new instance" do
      subject.should be_valid
    end
  end

  describe "instantiating a new object with no attributes" do
    subject { Presentation.new }

    it { should have(1).error_on(:title) }
    it { should have(2).errors_on(:speaker_id) }
  end
end
