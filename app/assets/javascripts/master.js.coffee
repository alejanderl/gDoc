jQuery ->
   
     $(".date_with_hours_and_minutes").datetimepicker();
     $("#accordion-block").accordion ->
          collapsible: true,
          active:false

     $(".add-term").click ->
          added = $(this).parent()
          added_id = $(this).parent().attr("data-id")
          $(this).addClass("remove-term")
          $(this).removeClass("add-term")
          
          $(this).parents(".taxonomy-terms").children(".active-taxonomies").append(added)
          
         
          
          
          

    
     $( "div.dialog" ).dialog
          autoOpen: false
          show: 
               effect: "blind"
               duration: 1000
          hide: 
               effect: "explode",
               duration: 1000
          
          
     $( ".open-dialog" ).click ->

          $("div.dialog").dialog("open");
    