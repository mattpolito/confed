jQuery(document).ready( function() {
  // Adding 'New Event' option to Event dropdown
  var event_dropdown = $("#presentation_event_id") 
  event_dropdown.addOption("0", "New Event", false);
  event_dropdown.change(function(e) {
    if($(this.options[this.selectedIndex]).text() == "New Event") {
      alert("NEW EVENT FORM");
    }
  });

  // Adding 'New Speaker' option to Speaker dropdown
  var speaker_dropdown = $("#presentation_speaker_id")
  speaker_dropdown.addOption("0", "New Speaker", false);
  speaker_dropdown.change(function() {
    if($(this.options[this.selectedIndex]).text() == "New Speaker") {
      alert("NEW SPEAKER FORM");
    }
  });
});
