// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
    $('a.detail_tab').click(function() {
      $('li.links_tab').removeClass('selected');
      $('li.detail_tab').addClass('selected');
      $('#topic_detail').show();
      $('#topic_links').hide();
    })
    $('a.links_tab').click(function() {
      $('li.links_tab').addClass('selected');
      $('li.detail_tab').removeClass('selected');
      $('#topic_detail').hide();
      $('#topic_links').show();
    })
})