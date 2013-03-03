module TaxonomiesHelper
  
  def button_create_term(key, value , term)
    
    render(:partial => 'taxonomies/create_term_button', :locals =>{:key => key, :value => value, :term => term})
    
  end
  
  def check_sons(id)
    
    @terms.select {|x| x[:parent_id]==id}.length >0
  end
  
  def print_sons
    
  end
  
 
  
  def terms_field_for(taxonomy)
    
    taxonomy_terms = OrderedArray.new(Term.get_taxonomy_terms  taxonomy).order
    render "taxonomies/family_names/family_names", {:taxonomy_terms => taxonomy_terms,:taxonomy_name => taxonomy}
    
  end
  
end
