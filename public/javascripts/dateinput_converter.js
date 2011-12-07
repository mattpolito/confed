// Based on http://snipt.net/boriscy/datetime-jquery-formtastic/
$.tools.dateinput.conf.format = 'yyyy-mm-dd';

$(document).ready(function() {
  $('.date, .datetime').each(function(i, el) {
    var sels = $(el).find("select:lt(3)");
    var noDate = isNaN(parseInt(sels[0].value))
    if(noDate) {
      var d = new Date;
    } else {
      var d = new Date(sels[0].value, parseInt(sels[1].value) - 1, sels[2].value);
    };
    var dateinput = $("<input type='date'>").dateinput({ value: d} );

    // Without this, the field is initially blank
    dateinput.val(dateinput.data().dateinput.getValue($.tools.dateinput.conf.format));

    dateinput.change(function(event, date) {
      $(sels[0]).val(date.getFullYear());
      $(sels[1]).val(date.getMonth() + 1);
      $(sels[2]).val(date.getDate());
    });
    $(sels[0]).before(dateinput);
    $(sels).hide();
  });
});
