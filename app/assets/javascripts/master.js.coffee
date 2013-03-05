jQuery ->

     $(".date_with_hours_and_minutes").datetimepicker();
     $("#accordion-block").accordion ->
          collapsible: true,
          active:false

     $(".add-term").click ->
          added = $(this).parent()
          added_id = $(this).parent().attr("data-id")
          added_taxonomy_name = $(this).parent().attr("data-name")
          $(this).addClass("remove-term")
          $(this).children().addClass("hidden")
          $(this).parent().removeClass("add-over")
          $(this).removeClass("add-term")
          the_cloned = added.clone()
          $("#terms-names-"+added_taxonomy_name+" ul div.clearfix").prepend(the_cloned)
          $(this).removeClass("add-term")
          $(this).addClass("inactive")
          $(this).parent().addClass("inactive") 
          value = $("#terms-id_"+added_taxonomy_name).val() + "," + added_id
          $("#terms-id_"+added_taxonomy_name).val(value)
          
          $(this).parent().addClass("add-over")
          
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
          
     $(".remove-term").click ->
          added_taxonomy_name = $(this).parent().attr("data-name")
          remove_id = $(this).parent().attr("data-id")
          value = $("#terms-id_"+added_taxonomy_name).val().split(",")
         
          value = value
          console.log( value)
          console.log( remove_id)
          value[value.indexOf(remove_id) + ""] = ""
          $("#terms-id_"+added_taxonomy_name).val(value.toString())
          $(this).parent().hide()
          
         
    
     $( "div.dialog" ).dialog
          autoOpen: false
          show: 
               effect: "fade"
               duration: 1000
         
          
          
     $( ".open-dialog" ).click ->          
          term = $(this).attr("data-taxonomy")
          $("div.dialog" ).dialog("close");
          $("div.dialog-"+term ).dialog("open");
          
 
   
    