# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).bind 'DOMSubtreeModified', () ->
  $(".modal-e").click ->
    $(".modal-e").css('display', 'none');
    $(".card-e").css('display', 'none');
  $("#new_btn").click ->
    $(".modal-e").css('display', 'block');
    $(".card-e").css('display', 'block');
  $(".edit_btn").click ->
    $(".modal-e").css('display', 'block');
    $(".card-e").css('display', 'block');
