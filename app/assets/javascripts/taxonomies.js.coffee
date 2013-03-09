# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
    #remove buttons. 
    $(".action-buttons").toggle()

    console.log($("document.dialog"))
    
    class Taxonomies_Terms
    
        constructor: (@taxonomy) ->
            @main = "taxonomy-terms-" + @taxonomy
            @assign_events ->
            
            
        hola: ->
            alert "hola"
            
        assign_events: ->
            
            $("div.dialog" ).dialog
                autoOpen: false
                show: 
                 effect: "fade"
                 duration: 1000
            $("span[id^=term]").bind 'mouseover', ->
               
                if $(this).children(".actions-active").length == 0
                    $(".actions-active").toggle();
                    $(".actions-active").removeClass("actions-active")
                    $(this).children("div.action-buttons").addClass "actions-active"
                    $(this).children("div.action-buttons").toggle("fast")
            $(".add-term").bind "mouseover" ,->
                $(this).children().removeClass("hidden")
                $(this).parent().addClass("add-over")
        
             $(".add-term").bind "mouseout" ,->
                $(this).children().addClass("hidden")
                $(this).parent().removeClass("add-over")
                  
             $(".remove-term").bind "mouseover",->
                $(this).children().removeClass("hidden")
                $(this).parent().addClass("delete-over")
                  
             $(".remove-term").bind "mouseout",->
                $(this).children().addClass("hidden")
                $(this).parent().removeClass("delete-over")
        
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
            
            
            $(".add-term").click ->
                taxonomies.add_term(this)
                  
            $(".remove-term").click ->
                added_taxonomy_name = $(this).parent().attr("data-name")
                remove_id = $(this).parent().attr("data-id")
                value = $("#terms-id_"+added_taxonomy_name).val().split(",")
                check_terms added_taxonomy_name
                value = value
                console.log( value)
                console.log( remove_id)
                value[value.indexOf(remove_id) + ""] = ""
                $("#terms-id_"+added_taxonomy_name).val(value.toString())
                $(this).parent().hide()
                  
            $(".colorbox").colorbox
                height: "80%"
            $( ".open-dialog" ).click ->          
                term = $(this).attr("data-taxonomy")
                $("div.dialog" ).dialog("close")
                $("div.dialog-"+term ).dialog("open")
            all_dialogs = $(".dialog")
            for d, i in all_dialogs
                this.check_terms($(d).attr("data-taxonomy"))
        remove_term:() ->
                
                
        add_term:(_that) ->
                console.log(_that)
                added = $(_that).parent()
                added_id = $(_that).parent().attr("data-id")
                added_taxonomy_name = $(_that).parent().attr("data-name")
                $(_that).addClass("remove-term")
                $(_that).children().addClass("hidden")
                $(_that).parent().removeClass("add-over")
                $(_that).removeClass("add-term")
                the_cloned = added.clone()
                $("#terms-names-"+added_taxonomy_name+" ul div.clearfix").prepend(the_cloned)
                $(_that).removeClass("add-term")
                value = $("#terms-id_"+added_taxonomy_name).val() + "," + added_id
                $("#terms-id_"+added_taxonomy_name).val(value)
                console.log added_taxonomy_name
                this.check_terms(added_taxonomy_name)
                $(_that).parent().addClass("add-over")
                  
        check_terms: (family) ->            
            active_terms = $("#terms-id_" +  family).val().split(",")
            current_list = $(".dialog-" + family + " ul li")
            for d, i in current_list
                id = $(d).attr("data-id")#                
                if $.inArray(id , active_terms) > 0
                    $(d).addClass("inactive")
                else
                    $(d).removeClass("inactive")
                    
                    
    window.taxonomies = new Taxonomies_Terms("tech")#

 
      
        