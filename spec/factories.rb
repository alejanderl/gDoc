#FactoryGirl.define :cycle do  |c|
#    c.title "Geek art"
#    c.description "A cool week"
#  end

FactoryGirl.define do
  factory :cycle do
    title "Cycle 1"
    description "Description of cycle 1"
  end
end

#def create_cycles
#  Cycle.create(:title => "Geek arg", :description => "lalala")
#  Cycle.create(:title => "Ohh lalala arg", :description => "OGG")

#end

