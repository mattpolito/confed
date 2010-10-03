require 'spec_helper'

describe Speaker do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:location).of_type(:string) }
  it { should have_db_column(:bio).of_type(:string) }
  it { should have_db_column(:company_name).of_type(:string) }
  it { should have_db_column(:company_url).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:twitter).of_type(:string) }
  it { should have_db_column(:website).of_type(:string) }
  it { should have_db_column(:speakerrate_url).of_type(:string) }

  it { should have_many(:presentations) }

  [ 'http://speakerrate.com/speakers/1-adam-walters',
    'http://speakerrate.com/speakers/2-matt-polito' ].each do |url|
    it { should allow_value(url).for(:speakerrate_url) }
  end

  [ 'http://google.com/speakers/1-adam-walters',
    'http://speakerrate.com/talks/1-ruby',
    'http://speakerrate.com/speakers/2-matt-polito.xml'].each do |url|
    it { should_not allow_value(url).for(:speakerrate_url) }
  end

  before(:each) do
    @valid_attributes = {
      :name => 'Name',
      :title => 'Title',
      :location => 'Location',
      :bio => 'Bio', 
      :company_name => 'Company Name',
      :company_url => 'http://companyurl.com',
      :email => 'test@email.com',
      :twitter => 'testguy',
      :website => 'http://myblog.com',
      :speakerrate_url => 'http://speakerrate.com/speakers/0101-some-guy'
    }
  end

  describe "instantiating a new object with valid attributes" do
    subject { Speaker.new(@valid_attributes) }

    it "creates a new instance" do
      subject.should be_valid
    end
  end

  describe "instantiating a new object with no attributes" do
    subject { Speaker.new }

    it { should have(1).error_on(:name) }
  end

end
