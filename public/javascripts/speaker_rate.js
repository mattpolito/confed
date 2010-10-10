var SpeakerRate = {};

SpeakerRate.init = function(inputs){
  this.inputs = inputs;
}

SpeakerRate.getSpeaker = function(speakerId){
  var url = '/admin/speaker_rate/speakers/'+ speakerId;
  var that = this;
  var selectorBase = '';
  if($('#facebox').length > 0){
    selectorBase = '#facebox ';
  }
  $.get(url, function(data){
    for(key in that.inputs){
      var value = data[key];
      // Biography is a special case in that it's an object, not a string -- should write a test for this in Jasmine...
      if(key == 'biography'){
        value = value['text'];
      }
      var selector = (selectorBase + '#' + that.inputs[key]);
      $(selector).val(value);
    }
  }, 'json');
};
