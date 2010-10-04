describe('SpeakerRate', function(){
  
  describe('init', function(){

    it('takes an object map of speakerrate keys to field ids', function(){
      SpeakerRate.init({'name' : 'speaker_name'});
      expect(SpeakerRate.inputs['name']).toEqual('speaker_name');
    });

  });

  describe('getSpeaker()', function(){
    beforeEach(function(){
      SpeakerRate.init({'name' : 'speaker_name'});
      spyOn($, 'get');
      SpeakerRate.getSpeaker('1-adam-walters');
    });

    it('calls the speaker_rate controller', function(){
      expect($.get).toHaveBeenCalled();
      var args = $.get.mostRecentCall.args;
      expect(args[0]).toEqual('/admin/speaker_rate/speakers/1-adam-walters');
    });

    it('updates the inputs with the returned values', function(){
      $('#jasmine_content').html($("<input id='speaker_name'/>"));
      var args = $.get.mostRecentCall.args;
      var callback = args[1];
      // Return someday to finish up these test...
      expect($('#speaker_name').val()).toEqual('');
      callback({'name' : 'Adam Walters'});
      expect($('#speaker_name').val()).toEqual('Adam Walters');
    });

  });
});
