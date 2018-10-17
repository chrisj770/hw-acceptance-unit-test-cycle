FactoryGirl.define do 
  factory :movie do |movie|
    movie.title = "The Sixth Sense"
    movie.director = "M. Night Shyamalan"
    movie.rating = "R"
    movie.release_date = {10.years.ago}
  end 
  
  factory :star_wars, :class => Movie do 
    movie.title = "Star Wars"
    movie.director = "George Lucas"
    movie.rating = "PG"
    movie.release_date = {30.years.ago}
  end 
  
end