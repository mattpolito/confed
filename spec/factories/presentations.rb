Factory.define :presentation do |f|
  f.title "Title"
  f.description "Description"
  f.association :event
  f.after_build { |p| p.speakers << Factory(:speaker) }
end

Factory.define :presentation_with_speakers, :parent => :presentation do |f|
  f.after_build { |p| p.speakers << Factory(:speaker, :name => "Donny Kerabatsos") }
end
