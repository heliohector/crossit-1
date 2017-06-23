$(document).ready(function () {
  $(document).on('click', '#sidenav li a', function (event) {
    history.pushState(null, null, event.target.href);
    $('content').load(event.target.href+' content');
    event.preventDefault();
  })
  $(window).on('popstate', function(event){
    $('content').load(location.href+' content');
  })
});