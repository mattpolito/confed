require 'spec_helper'

describe EventsHelper do
  describe "#displayed_date_for" do
    describe "when started_on & ended_on are available" do
      it "returns completed combo date string" do
        event = mock_model(Event, :started_on => 1.day.ago, 
                                  :ended_on => 1.day.from_now)
        string = helper.displayed_date_for(event)
        string.should == "#{event.started_on.strftime("%m.%d.%Y")} - #{event.ended_on.strftime("%m.%d.%Y")}"
      end
    end

    describe "when ended_on is missing" do
      it "returns empty string" do
        event = mock_model(Event, :started_on => 1.day.ago, :ended_on => nil)
        helper.displayed_date_for(event).should be_blank
      end
    end

    describe "when started_on is missing" do
      it "returns empty string" do
        event = mock_model(Event, :started_on => nil, :ended_on => 1.day.from_now)
        helper.displayed_date_for(event).should be_blank
      end
    end
  end
end
