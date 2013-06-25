# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$("#project_project_id").change -> 
  		window.location.href = "/manager/" + $(this).val()

	$(".abaExtra").click ->
	  unless $(this).hasClass("selected")
	    abaTarget = $(this).attr("data-aba")
	    $(".abaExtra").removeClass "selected"
	    $(this).addClass "selected"
	    $(".boxTextos").hide()
	    $("." + abaTarget).fadeIn()

	$("#user_user_id").change -> 
  	   window.location.href = "/rh/" + $(this).val()
  	