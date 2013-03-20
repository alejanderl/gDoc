jQuery ->

          
     $(".date_with_hours_and_minutes").datetimepicker();
     $("#accordion-block").accordion ->
          collapsible: true,
          active:false
     $(".add-related-deploy").on "click", ->
          $(this).toggleClass "active"
          $(this).parent("#add-related ").toggleClass "active"
          $(this).nextAll("div#add-related-buttons").toggle ->
               
               
     $('.box_container .description').expander 
          slicePoint:       200
          expandPrefix:     ' '
          expandText:       '...<br/>[...]'
          collapseTimer:    0
          userCollapseText: '[^]'

     
     
     $('#remove-image').on "click", ->

          $(this).prev().toggle ->
          $(this).toggle ->
          $(this).next(".field").toggle ->
          

     
     undefined
   
    