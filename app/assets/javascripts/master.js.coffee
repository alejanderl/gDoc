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
          $(this).removeClass("add-term")
          $("#terms-names-"+added_taxonomy_name+" ul div.clearfix").prepend(added)          
          value = $("#terms-id_"+added_taxonomy_name).val() + "," + added_id
          $("#terms-id_"+added_taxonomy_name).val(value)
     
     $(".remove-term").bind "mouseover",->
          $(this).children().removeClass("hidden")
          $(this).parent().addClass("delete-over")
     
     $(".remove-term").bind "mouseout",->
          $(this).children().addClass("hidden")
          $(this).parent().removeClass("delete-over")
          
     $(".remove-term").click ->
          
          
         
    
     $( "div.dialog" ).dialog
          autoOpen: false
          show: 
               effect: "fade"
               duration: 1000
         
          
          
     $( ".open-dialog" ).click ->          
          term = $(this).attr("data-taxonomy")
          $("div.dialog" ).dialog("close");
          $("div.dialog-"+term ).dialog("open");
    