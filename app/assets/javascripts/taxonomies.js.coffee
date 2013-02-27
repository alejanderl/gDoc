# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    
    $("span[id^=term]").bind 'mouseover', ->
                                console.log($(this).children("actions-active"))
                                if $(this).children(".actions-active").length == 0
                                    $(".actions-active").toggle();
                                    $(".actions-active").removeClass("actions-active")
                                    $(this).children("div.action-buttons").addClass "actions-active"
                                    $(this).children("div.action-buttons").toggle("fast");
   
    $(".action-buttons").toggle()