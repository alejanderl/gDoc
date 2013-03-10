xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.metadata('xmlns' => 'http://example.org/myapp/', 'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance', 'xmlns:dc'=> 'http://purl.org/dc/elements/1.1/', 'xmlns:dcterms' => 'http://purl.org/dc/terms/') do
  @events.each do |event|
     xml.tag!("dc:identifier",event.uid)
     xml.tag!("dc:title",event.title)
     xml.tag!("dc:creator",event.creator)
     xml.tag!("dc:contributor",event.contributor)
     xml.tag!("dc:description",event.description)
     xml.tag!("dc:temporal xsi:type='PeriodOfTime'",event.start_date)
     xml.tag!("dc:temporal xsi:type='PeriodOfTime'",event.end_date)
     xml.tag!("dc:subject",event.terms)
    end	
end