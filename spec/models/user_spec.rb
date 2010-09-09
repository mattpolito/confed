require 'spec_helper'

describe User do
  it { should have_db_column(:email).of_type(:string).with_options(:null => false) }
  it { should have_db_column(:encrypted_password) }
  it { should have_db_column(:password_salt).of_type(:string) }
end
