var uservoiceOptions = {
  /* required */
  key: 'confed',
  host: 'confed.uservoice.com', 
  forum: '83143',
  showTab: true,  
  /* optional */
  alignment: 'right',
  background_color:'#ccc', 
  text_color: 'white',
  hover_color: '#A9CBE7',
  lang: 'en'
};

function _loadUserVoice() {
  var s = document.createElement('script');
  s.setAttribute('type', 'text/javascript');
  s.setAttribute('src', ("https:" == document.location.protocol ? "https://" : "http://") + "cdn.uservoice.com/javascripts/widgets/tab.js");
  document.getElementsByTagName('head')[0].appendChild(s);
}
_loadSuper = window.onload;
window.onload = (typeof window.onload != 'function') ? _loadUserVoice : function() { _loadSuper(); _loadUserVoice(); };
