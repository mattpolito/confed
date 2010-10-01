require 'spec_helper'

describe ApplicationHelper do
  describe "#active_class" do
    before do
      controller.request.stub(:path).and_return('/some_path')
    end

    describe "when path passed matches current url" do
      it "returns active" do
        helper.active_class('/some_path').should == 'active'
      end
    end

    describe "when path passed matches a portion of current url" do
      it "returns active" do
        controller.request.stub(:path).and_return('/some_path/action')
        helper.active_class('/some_path').should == 'active'
      end
    end
    
    describe "when path passed does not match current url" do
      it "returns nil" do
        helper.active_class('/some_other_path').should be_nil
      end
    end
  end
end

