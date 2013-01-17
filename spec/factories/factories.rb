FactoryGirl.define do
  




end


 def create_photo(attrs = {})
  attrs = attrs.dup
  attrs[:title] ||= "Photo title  #{String.random(10)}"
  attrs[:description] ||= String.random(10)
  Photo.create!(attrs)
end