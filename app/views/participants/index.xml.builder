xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.metadata('xmlns' => 'http://example.org/myapp/', 'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance', 'xmlns:dc'=> 'http://purl.org/dc/elements/1.1/', 'xmlns:dcterms' => 'http://purl.org/dc/terms/') do
  @participants.each do |participant|
     xml.tag!("dc:identifier", participant.uid)
     xml.tag!("dc:name",participant.name+participant.surname)
     xml.tag!("dc:description",participant.bio)
     xml.tag!("dc:language",participant.language)
     xml.tag!("dc:subject") do
      participant.terms.each do |term|	
        xml.keyword term.name
      end		
     end  		
    end	
end