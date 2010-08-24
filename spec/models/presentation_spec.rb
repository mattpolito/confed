require 'spec_helper'

describe Presentation do
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:description).of_type(:text) }

  before(:each) do
    @valid_attributes = {
      :title => 'title',
      :description => 'description'
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
  end
end
