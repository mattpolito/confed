require 'spec_helper'

describe EventsHelper do
  describe "#displayed_date_for" do
    let(:event) { mock_model(Event) }

    describe "when started_on & ended_on are available" do
      it "returns completed combo date string" do
        event.stub(:started_on).and_return(Time.parse('2011-01-15'))
        event.stub(:ended_on).and_return(Time.parse('2011-01-16'))
        event.stub(:started_on?).and_return(true)
        event.stub(:ended_on?).and_return(true)
        string = helper.displayed_date_for(event)
        string.should == "01.15.2011 - 01.16.2011"
      end
    end

    describe "when ended_on is missing" do
      it "returns empty string" do
        event.stub(:started_on?).and_return(true)
        event.stub(:ended_on?).and_return(false)
        helper.displayed_date_for(event).should be_blank
      end
    end

    describe "when started_on is missing" do
      it "returns empty string" do
        event.stub(:started_on?).and_return(false)
        event.stub(:ended_on?).and_return(true)
        helper.displayed_date_for(event).should be_blank
      end
    end
  end
end
