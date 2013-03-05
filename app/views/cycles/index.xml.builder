xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.metadata('xmlns' => 'http://example.org/myapp/', 'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance', 'xmlns:dc'=> 'http://purl.org/dc/elements/1.1/', 'xmlns:dcterms' => 'http://purl.org/dc/terms/') do
  @cycles.each do |cycle|
     xml.tag!("dc:identifier",cycle.uid)
     xml.tag!("dc:title",cycle.title)
     xml.tag!("dc:creator",cycle.creator)
     xml.tag!("dc:contributor",cycle.contributor)
     xml.tag!("dc:description",sanitize(cycle.description))
     xml.tag!("dc:temporal",cycle.start_date)
     xml.tag!("dc:temporal",cycle.end_date)
     xml.tag!("dc:subject") do
      cycle.terms.each do |term|	
        xml.keyword term.name
      end		
     end  		
    end	
end