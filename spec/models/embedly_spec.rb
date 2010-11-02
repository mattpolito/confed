require 'spec_helper'

describe Embedly do
  describe '.get_attrs' do
    it 'accepts an optional max_width parameter passed to Emebedly' do
      HTTParty.should_receive(:get).with(/maxwidth=200/)
      Embedly.get_attrs("http://foo.com", :max_width => 200)
    end

    it 'defaults to a max_width of 592' do
      HTTParty.should_receive(:get).with(/maxwidth=592/)
      Embedly.get_attrs("http://foo.com")
    end
  end
end
