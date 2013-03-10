xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.metadata('xmlns' => 'http://example.org/myapp/', 'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance', 'xmlns:dc'=> 'http://purl.org/dc/elements/1.1/', 'xmlns:dcterms' => 'http://purl.org/dc/terms/') do
  @videos.each do |video|
     xml.tag!("dc:identifier",video.uid)
     xml.tag!("dc:title",video.title)
     xml.tag!("dc:creator",video.creator)
     xml.tag!("dc:description",video.description)
     xml.tag!("dc:date",video.date)
     xml.tag!("dc:rights",video.license)
     xml.tag!("dc:format",video.format)
     xml.tag!("dc:date",video.date)
     xml.tag!("dc:language",video.language)
     xml.tag!("dc:subject") do
      video.terms.each do |term|	
        xml.keyword term.name
      end		
     end  		
    end	
end