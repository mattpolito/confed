$(function(){
  SpeakerRate.init({
    name : 'speaker_name',
    company : 'speaker_company_name',
    company_website : 'speaker_company_url',
    biography : 'speaker_bio',
    personal_website : 'speaker_website',
    location : 'speaker_location',
    twitter_username : 'speaker_twitter',
    title : 'speaker_title'
  });

  $('#speaker_rate_link').live('click', function(e){
    e.preventDefault();
    var selectorBase = '';
    if($('#facebox').length > 0){
      selectorBase = '#facebox ';
    }
    var speakerRateId = $(selectorBase + '#speaker_speaker_rate_id').val();
    if(speakerRateId == ''){
      return;
    }
    SpeakerRate.getSpeaker(speakerRateId);
  });
});
