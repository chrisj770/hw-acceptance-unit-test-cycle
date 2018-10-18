FactoryGirl.define do 
  factory :movie do |movie|
    movie.title        "The Sixth Sense"
    movie.rating       {"R"}
    movie.release_date {10.years.ago}
  end 

#  factory :indiana_jones_1, :class => Movie do |movie|
#   movie.title         "Indiana Jones: Raiders of the Lost Ark"
#    movie.rating        "PG"
#    movie.release_date {50.years.ago}
#    movie.director     "Steven Spielberg"
#  end
#  
#  factory :indiana_jones_2, :class => Movie do |movie|
#    movie.title        "Indiana Jones and the Temple of Doom"
#    movie.rating       "PG"
#    movie.release_date {40.years.ago}
#    movie.director     "Steven Spielberg"
# end
#  
#  factory :the_incredibles, :class => Movie do |movie|
#    movie.title        "The Incredibles"
#    movie.rating       "PG"
#    movie.release_date {14.years.ago}
#    movie.director     "Brad Bird"
#  end 
end