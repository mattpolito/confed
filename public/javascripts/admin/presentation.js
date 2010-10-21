$(function(){
  // Adding 'New Event' option to Event dropdown
  var eventDropdown = $("#presentation_event_id") 
  eventDropdown.addOption("0", "New Event", false);
  eventDropdown.change(function(e) {
    if($(this.options[this.selectedIndex]).text() == "New Event") {
      $.facebox({
        div: '#event_form',
      })

      $("form#new_event").live('submit', function(e) {
        e.preventDefault();
        var url = $(this).attr('action');
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
  var currentSelect;
  $('.speaker_select').live('change', function(){
    var speakerDropdown = $("#presentation_speaker_id_0");
    currentSelect = this;
    if($(this.options[this.selectedIndex]).val() == "new") {
      jQuery.facebox({ 
        div: '#speaker_form'
      });
    }
  });

  // Add new user to options and select
  $("form#new_speaker").live('submit', function(e) {
    e.preventDefault();
    var url = $(this).attr('action');
    $.ajax({
      type: 'POST',
      url: url,
      data: $(this).serialize(),
      dataType: 'json',
      success: function(data, textStatus, xhr) {
        $(currentSelect).addOption(data['speaker'].id, data['speaker'].name).sortOptions(true);
        currentSelect = null;
        $(document).trigger('close.facebox')
      },
      error: function(data, textStatus, xhr) {
        $("form#new_speaker").replaceWith(data.responseText);
      }
    });
  });

  // Create new speaker select
  $('#new_speaker').click(function(e){
    var speakerList = $('ul.speakers');
    $('ul.speakers li:first').clone().appendTo('ul.speakers')
  });

});
