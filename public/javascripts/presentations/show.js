$(function() {

  function addDimensionsToEmbedContainer(container_element) {
    var embed = container_element.children();
    container_element.attr('style', 
      'height:' + embed.attr('height') + 'px; width:' + embed.attr('width') + 'px;'
    );
  };

  // add width to .video class
  addDimensionsToEmbedContainer($('.video'));
  
  // add width to .slideshow class
  addDimensionsToEmbedContainer($('.slideshow'));
});
