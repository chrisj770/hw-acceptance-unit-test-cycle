class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def find_similar
    if self.director.nil? || self.director.empty?
      return nil
    end
    Movie.where(director: self.director).order({:title => :asc})
  end
    
end
