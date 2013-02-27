module TaxonomiesHelper
  
  def button_create_term(key, value , term)
    
    render(:partial => 'taxonomies/create_term_button', :locals =>{:key => key, :value => value, :term => term})
    
  end
  
  def check_sons(id)
    
    @terms.select {|x| x[:parent_id]==id}.length >0
  end
  
  def print_sons
    
  end
  
end
