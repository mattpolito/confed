require 'spec_helper'

describe SavedPresentation do
  it { should belong_to(:presentation) }
  it { should belong_to(:user) }
end
