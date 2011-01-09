require 'spec_helper'

describe Role do
  it { should have_db_column(:name).of_type(:string) }

  it { should have_and_belong_to_many(:users) }

  describe 'admin' do
    it 'returns a role with name "admin"' do
      Role.admin.name.should == 'admin'
    end
  end
end
