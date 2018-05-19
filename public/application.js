$(function () {

  
  // Search form.
  $('#profiles_search').submit(function () {
    $.get(this.action, $(this).serialize(), null, 'script');
    return false;
  });

/*
  $('#profiles_search input').keyup(function () {
  $.get($('#profiles_search').attr('action'), &crarr; 
    $('#profiles_search').serialize(), null, 'script');
  return false;
  });
  */

});