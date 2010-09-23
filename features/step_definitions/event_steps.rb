Given /^an event with the following:$/ do |table|
  new_table = table.transpose
  new_table.map_headers!{ |header| header.downcase.gsub(/\s+/, "_") }
  new_table.hashes.each do |attributes|
    @event = Event.new(
      Factory.attributes_for(:event, attributes)
    )
    @event.save!
  end
end

Given /^ an event$/ do
  @event = Factory(:event)
end
