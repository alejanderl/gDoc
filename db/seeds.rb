

  user = User.create(:email => "admin@example.com", :password => "admin123", :password_confirmation => "admin123")
  user.roles_mask = 1
  user.save
  User.create(:email => "alejandro@example.com", :password => "alx123", :password_confirmation => "alx123")
  User.create(:email => "carolina@example.com", :password => "caro123", :password_confirmation => "caro123")
  

  Cycle.create(:title => "Cycle 1", :description => "Cycle 1 description", :start_date => "2013-02-10", :end_date =>"2013-02-15 ")
  Cycle.create(:title => "Cycle 2", :description => "Cycle 2 description", :start_date => "2013-02-13", :end_date =>"2013-02-25 ")
  Cycle.create(:title => "Cycle 3", :description => "Cycle 3 description", :start_date => "2013-03-1", :end_date =>"2013-03-15 ")

  Event.create(:title => "Cool event ever", :description => "Come and see", :date => "2013-02-11", :time =>"21:00")
  Event.create(:title => "Year Conf", :description => "One more year we are back!!", :date => "2013-03-12", :time =>"10:00")
  Event.create(:title => "3D printing", :description => "Latest news on 3D printing", :date => "2013-02-10", :time =>"11:00")
  event = Event.create(:title => "Comic-thon", :description => "48h for creating collective comics", :date => "2013-03-02", :time =>"12:00")
  event.addresses.build(:address => "Planufer 90", :postcode => "10967", :city => "Berlin" , :country =>"Germany" )
  event.save


  Audio.create(:title => "Cool audio", :description => "Come and see", :date => "2013-02-11", :license => "Creative commons", :format => "mp3", :duration => "1hour", :language => "English")
  Audio.create(:title => "Cool audio ever2 ", :description => "Come and see", :date => "2013-02-11", :license => "Creative commons", :format => "mp3", :duration => "1hour", :language => "English")
  
  Term.create(name: "Medieval", taxonomy_name: "art")
  Term.create(name: "Barroco", taxonomy_name: "art")
  Term.create(name: "Renacimiento", taxonomy_name: "art")
  Term.create(name: "Neolitico", taxonomy_name: "art")
  Term.create(name: "Romantico", taxonomy_name: "art")
  Term.create(name: "Contemporaneo", taxonomy_name: "art")
  Term.create(name: "Linux", taxonomy_name: "tech")
  Term.create(name: "Apple", taxonomy_name: "tech")
  Term.create(name: "Windows", taxonomy_name: "tech")
  