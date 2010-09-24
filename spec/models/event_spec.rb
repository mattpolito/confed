require 'spec_helper'

describe Event do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:started_on).of_type(:datetime) }
  it { should have_db_column(:ended_on).of_type(:datetime) }

  it { should have_many(:presentations) }
  it { should have_many(:speakers).through(:presentations) }

  let(:valid_attributes) do
    {
      :name       => 'Event',
      :started_on => '2010-09-17 00:00:00 UTC',
      :ended_on   => '2010-09-17 00:00:00 UTC'
    }
  end

  describe "when instantiating" do
    describe "with valid attributes" do
      subject { Event.new(valid_attributes) }

      it "creates a new object instance" do
        subject.should be_valid
      end
    end

    describe "with invalid attributes" do
      subject { Event.new }

      it { should have(1).error_on(:name) }
    end
  end
end
