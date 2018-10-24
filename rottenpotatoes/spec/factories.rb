FactoryGirl.define do 
  factory :movie do |movie|
    movie.title        "The Sixth Sense"
    movie.rating       {"R"}
    movie.release_date {10.years.ago}
  end 
end