require "spec_helper"

RSpec::Matchers.define :allow do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
  end
end

describe Permission do
  
  before do
    create_sample_cycles
    create_sample_events
    create_sample_users
  end
  
  describe "as guest" do
    subject { Permission.new(nil) }
    
    it { should allow("cycles", "index") }
    it { should allow("cycles", "show") }
    it { should_not allow("events", "new") }
    it { should_not allow("events", "create") }
    it { should_not allow("events", "edit") }
    it { should_not allow("events", "update") }
    it { should_not allow("events", "destroy") }


    it { should allow("devise/sessions", "create") }


  end
  
  describe "as admin" do
    subject { Permission.new(User.first) }
    #subject { user_login("admin@example.com", "admin123") }
    
    it { should allow("events", "destroy") }
    it { should allow("events", "create") }
  end
  
  describe "as member" do
    subject { Permission.new(User.last) }
    #subject { user_login("alejandro@example.com", "alx123") }
    it { should allow("events", "index") }
    it { should allow("events", "show") }
    it { should_not allow?("events", "new") }
    it { should_not allow?("events", "create") }
    it { should_not allow?("events", "edit") }
    it { should_not allow?("events", "update") }
    it { should_not allow?("events", "destroy") }

    it { should allow?("devise/registrations", "new") }
    it { should allow?("devise/sessions", "create") }
    it { should allow?("devise/sessions", "destroy") }


  end
end