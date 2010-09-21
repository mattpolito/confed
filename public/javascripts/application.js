$(document).ready(function() {
  $('#presentation_slideshows_attributes_0_url').blur(function(e) {
    e.preventDefault;
    var slideshow_uri = this.value
    $.embedly(slideshow_uri, {maxWidth:250}, function(oembed, dict) {
      $('#slideshow_placeholder').append(oembed.html);
      $('#presentation_slideshows_attributes_0_content').val(oembed.html);
    });
  });

  $('#presentation_videos_attributes_0_url').blur(function(e) {
    e.preventDefault;
    var slideshow_uri = this.value
    $.embedly(slideshow_uri, {maxWidth:250}, function(oembed, dict) {
      $('#video_placeholder').append(oembed.html);
      $('#presentation_videos_attributes_0_content').val(oembed.html);
    });
  });
});

