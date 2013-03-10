xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.metadata('xmlns' => 'http://example.org/myapp/', 'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance', 'xmlns:dc'=> 'http://purl.org/dc/elements/1.1/', 'xmlns:dcterms' => 'http://purl.org/dc/terms/') do
  @documents.each do |document|
     xml.tag!("dc:identifier", document.uid)
     xml.tag!("dc:title",document.title)
     xml.tag!("dc:creator",document.creator)
     xml.tag!("dc:description",document.description)
     xml.tag!("dc:date",document.date)
     xml.tag!("dc:rights",document.license)
     xml.tag!("dc:format",document.format)
     xml.tag!("dc:date",document.date)
     xml.tag!("dc:language",document.language)
     xml.tag!("dc:subject") do
      document.terms.each do |term|	
        xml.keyword term.name
      end		
     end  		
    end	
end