Given /^a speaker with the following:$/ do |table|
  new_table = table.transpose
  new_table.map_headers!{ |header| header.downcase.gsub(/\s+/, "_") }
  new_table.hashes.each do |attributes|
    @speaker = Factory(:speaker, attributes)
  end
end

Given /^a speaker$/ do
  @speaker = Factory(:speaker)
end
