require 'spec_helper'

describe Embedly do
  describe 'get_attrs' do
    it 'accpets an optional max_width parameter passed to Emebedly' do
      HTTParty.should_receive(:get).with(/maxwidth=200/)
      Embedly.get_attrs("http://foo.com", :max_width => 200)
    end

    it 'defaults to a max_width of 640' do
      HTTParty.should_receive(:get).with(/maxwidth=640/)
      Embedly.get_attrs("http://foo.com")
    end
  end
end
