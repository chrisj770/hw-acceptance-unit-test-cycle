class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def find_similar
    Movie.where(director: self.director).order({:title => :asc})
  end
    
end
