jQuery(document).ready( function() {
  // Adding 'New Event' option to Event dropdown
  var event_dropdown = $("#presentation_event_id") 
  event_dropdown.addOption("0", "New Event", false);
  event_dropdown.change(function(e) {
    if($(this.options[this.selectedIndex]).text() == "New Event") {
      $.facebox({
        div: '#event_form',
      })

      $("form#new_event").live('submit', function(e) {
        e.preventDefault();
        var url = $(this).attr('action');
        console.log(url);
        $.ajax({
          type: 'POST',
          url: url,
          data: $(this).serialize(),
          dataType: 'json',
          success: function(data, textStatus, xhr) {
            $("#presentation_event_id").addOption(data['event'].id, data['event'].name).sortOptions(true);
            $(document).trigger('close.facebox')
          },
          error: function(data, textStatus, xhr) {
            $("form#new_event").replaceWith(data.responseText);
          }
        });
      });
    }
  });

  // Adding 'New Speaker' option to Speaker dropdown
  var speaker_dropdown = $("#presentation_speaker_id")
  speaker_dropdown.addOption("0", "New Speaker", false);
  speaker_dropdown.change(function() {
    if($(this.options[this.selectedIndex]).text() == "New Speaker") {
      jQuery.facebox({ 
        div: '#speaker_form'
      })

      $("form#new_speaker").live('submit', function(e) {
        e.preventDefault();
        var url = $(this).attr('action');
        $.ajax({
          type: 'POST',
          url: url,
          data: $(this).serialize(),
          dataType: 'json',
          success: function(data, textStatus, xhr) {
            $("#presentation_speaker_id").addOption(data['speaker'].id, data['speaker'].name).sortOptions(true);
            $(document).trigger('close.facebox')
          },
          error: function(data, textStatus, xhr) {
            $("form#new_speaker").replaceWith(data.responseText);
          }
        });
      });
    }
  });

});
