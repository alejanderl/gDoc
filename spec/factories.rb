
#Log in as user
def user_login (email, password)
  visit "/users/sign_in"
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Sign in"
end

 # Logout as user
def user_logout
  visit "/users/sign_out"
  page.should have_content "Signed out successfully."
  
end


#Sample data
def create_sample_users
  User.create(:email => "admin@example.com", :password => "admin123", :password_confirmation => "admin123")
  User.create(:email => "alejandro@example.com", :password => "alx123", :password_confirmation => "alx123")
  User.create(:email => "carolina@example.com", :password => "caro123", :password_confirmation => "caro123")
end


def create_sample_cycles
  Cycle.create(:title => "Cycle 1", :description => "Cycle 1 description", :start_date => "2013-02-10", :end_date =>"2013-02-15 ")
  Cycle.create(:title => "Cycle 2", :description => "Cycle 2 description", :start_date => "2013-02-13", :end_date =>"2013-02-25 ")
  Cycle.create(:title => "Cycle 3", :description => "Cycle 3 description", :start_date => "2013-03-1", :end_date =>"2013-03-15 ")
end

def create_sample_documents(attrs = {})
    attrs2 = attrs.dup
    attrs2[:title] ||= "Document random#{rand(1000)}"
    attrs2[:description] ||= "Description random#{rand(1000)}"
    Document.create!(attrs2)
 end 

def create_sample_photos(attrs = {})
    attrs2 = attrs.dup
    attrs2[:title] ||= "Photos random#{rand(1000)}"
    attrs2[:description] ||= "Description random#{rand(1000)}"
    Photo.create!(attrs2)
end 
 
def create_sample_videos(attrs = {})
    attrs2 = attrs.dup
    attrs2[:title] ||= "Document random#{rand(1000)}"
    attrs2[:description] ||= "Description random#{rand(1000)}"
    Video.create!(attrs2)
end

def create_sample_events
  Event.create(:title => "Cool event ever", :description => "Come and see", :date => "2013-02-11", :time =>"21:00")
  Event.create(:title => "Year Conf", :description => "One more year we are back!!", :date => "2013-03-12", :time =>"10:00")
  Event.create(:title => "3D printing", :description => "Latest news on 3D printing", :date => "2013-02-10", :time =>"11:00")
  
  event = Event.create(:title => "Comic-thon", :description => "48h for creating collective comics", :date => "2013-03-02", :time =>"12:00")
  event.addresses.build(:address => "Planufer 90", :postcode => "10967", :city => "Berlin" , :country =>"Germany" )
  event.save
end

def create_sample_tags
  cycle = Cycle.first
  cycle.tag_list = "e-textile, art"
  cycle.save
end

def create_sample_audios
  Audio.create(:title => "Cool audio", :description => "Come and see", :date => "2013-02-11", :license => "Creative commons", :format => "mp3", :duration => "1hour", :language => "English")
  Audio.create(:title => "Cool audio ever2 ", :description => "Come and see", :date => "2013-02-11", :license => "Creative commons", :format => "mp3", :duration => "1hour", :language => "English")
end
