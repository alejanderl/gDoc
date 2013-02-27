# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    
    $("span[id^=term]").bind 'mouseover', ->
                                
                                if $(this).children(".actions-active").length == 0
                                    $(".actions-active").toggle();
                                    $(".actions-active").removeClass("actions-active")
                                    $(this).children("div.action-buttons").addClass "actions-active"
                                    $(this).children("div.action-buttons").toggle("fast");
   
    $(".action-buttons").toggle()
    
    $(".deploy-button").bind 'click', ->
        button = $(this)
        $(this).next().next().toggle "fast", ->
            if $(this).is(":hidden")
                button.addClass("icon-chevron-right")
                button.removeClass("icon-chevron-down")
            else
                button.removeClass("icon-chevron-right")
                button.addClass("icon-chevron-down")
    $(".deploy-button").hide()
    $("li.parent-0 ul").hide()
    $("li.parent-0 ul ul").show()
    $("li.parent-0 ul").prev().prev().show()
  
    