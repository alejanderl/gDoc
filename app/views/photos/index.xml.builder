xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.metadata('xmlns' => 'http://example.org/myapp/', 'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance', 'xmlns:dc'=> 'http://purl.org/dc/elements/1.1/', 'xmlns:dcterms' => 'http://purl.org/dc/terms/') do
  @photos.each do |photo|
     xml.tag!("dc:identifier", photo.uid)
     xml.tag!("dc:title",photo.title)
     xml.tag!("dc:creator",photo.creator)
     xml.tag!("dc:description",photo.description)
     xml.tag!("dc:date",photo.date)
     xml.tag!("dc:rights",photo.license)
     xml.tag!("dc:format",photo.format)
     xml.tag!("dc:date",photo.date)
     xml.tag!("dc:language",photo.language)
     xml.tag!("dc:subject") do
      photo.terms.each do |term|	
        xml.keyword term.name
      end		
     end  		
    end	
end