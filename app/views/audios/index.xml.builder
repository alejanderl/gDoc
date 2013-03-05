xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.metadata('xmlns' => 'http://example.org/myapp/', 'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance', 'xmlns:dc'=> 'http://purl.org/dc/elements/1.1/', 'xmlns:dcterms' => 'http://purl.org/dc/terms/') do
  @audios.each do |audio|
     xml.tag!("dc:identifier",audio.uid)
     xml.tag!("dc:title",audio.title)
     xml.tag!("dc:creator",audio.creator)
     xml.tag!("dc:description",audio.description)
     xml.tag!("dc:date",audio.date)
     xml.tag!("dc:rights",audio.license)
     xml.tag!("dc:format",audio.format)
     xml.tag!("dc:date",audio.date)
     xml.tag!("dc:language",audio.language)
     xml.tag!("dc:subject") do
      audio.terms.each do |term|	
        xml.keyword term.name
      end		
     end  		
    end	
end