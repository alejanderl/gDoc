module TaxonomiesHelper
  
  def button_create_term(key, value , term)
    
    render(:partial => 'taxonomies/create_term_button', :locals =>{:key => key, :value => value, :term => term})
    
  end
  
  
end
