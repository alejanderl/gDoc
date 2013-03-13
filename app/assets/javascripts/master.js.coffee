jQuery ->

          
     $(".date_with_hours_and_minutes").datetimepicker();
     $("#accordion-block").accordion ->
          collapsible: true,
          active:false
     $(".add-related-deploy").on "click", ->
          $(this).toggleClass "active"
          $(this).parent("#add-related ").toggleClass "active"
          $(this).nextAll("div#add-related-buttons").toggle ->

     return
   
    