require 'spec_helper'

describe Speaker do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:location).of_type(:string) }
  it { should have_db_column(:bio).of_type(:text) }
  it { should have_db_column(:company_name).of_type(:string) }
  it { should have_db_column(:company_url).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:twitter).of_type(:string) }
  it { should have_db_column(:website).of_type(:string) }
  it { should have_db_column(:speaker_rate_id).of_type(:string) }

  it { should have_and_belong_to_many(:presentations) }

  let(:valid_attributes) do
    {
      :name => 'Name',
      :title => 'Title',
      :location => 'Location',
      :bio => 'Bio', 
      :company_name => 'Company Name',
      :company_url => 'http://companyurl.com',
      :email => 'test@email.com',
      :twitter => 'testguy',
      :website => 'http://myblog.com',
      :speaker_rate_id => '101-some-guy'
    }
  end

  describe "instantiating a new object with valid attributes" do
    subject { Speaker.new(valid_attributes) }

    it "creates a new instance" do
      subject.should be_valid
    end
  end

  describe "instantiating a new object with no attributes" do
    subject { Speaker.new }

    it { should have(1).error_on(:name) }
  end

  describe "validation for" do
    subject { Speaker.new(valid_attributes) }
    describe "#twitter" do
      it "passes when there is only twitter handle" do
        subject.twitter = 'mattpolito' 
        subject.should be_valid
      end

      [
        'http://twitter.com/mattpolito',
        'https://twitter.com/mattpolito',
        'http://www.twitter.com/mattpolito',
        'https://www.twitter.com/mattpolito'
      ].each do |uri|
        it "fails when there is a twitter like #{uri}" do
          subject.twitter = uri
          subject.should_not be_valid
        end
      end
    end

    describe "#speaker_rate_id" do
      [ '1-adam-walters',
        '2-matt-polito' ].each do |id|
        it { should allow_value(id).for(:speaker_rate_id) }
      end

      [ 'adam-walters',
        '1-adam-walters.json',
        '2-matt-polito.xml'].each do |id|
        it { should_not allow_value(id).for(:speaker_rate_id) }
      end
    end
  end

end
