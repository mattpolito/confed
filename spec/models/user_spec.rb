require 'spec_helper'

describe User do
  it { should have_db_column(:email).of_type(:string).with_options(:null => false) }
  it { should have_db_column(:encrypted_password).of_type(:string) }
  it { should have_db_column(:password_salt).of_type(:string) }

  it { should have_and_belong_to_many(:roles) }
  it { should have_many(:saved_presentations) }

  describe "#has_role?" do
    subject { User.new }

    it "returns true when passed role is attached to user" do
      subject.roles << Role.admin
      subject.should have_role(:admin)
    end

    it "returns true when passed a role with multiple words that is attached to user" do
      subject.roles << Factory(:super_admin_role)
      subject.should have_role(:super_admin)
    end

    it "returns false when passed a role that user does not have" do
      subject.should_not have_role(:admin)
    end
  end
end
