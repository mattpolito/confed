Given /^an event with the following:$/ do |table|
  new_table = table.transpose
  new_table.map_headers!{ |header| header.downcase.gsub(/\s+/, "_") }
  new_table.hashes.each do |attributes|
    @event = Factory(:event, attributes)
  end
end

Given /^ an event$/ do
  @event = Factory(:event)
end
