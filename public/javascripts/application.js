$(function(){
  // article.presentation exists on presentations#index and presentations#show, but plugin
  // only loaded for #show
  if(typeof $.fn.preloader == 'function'){
    $('article.presentation').preloader();
  }
});
