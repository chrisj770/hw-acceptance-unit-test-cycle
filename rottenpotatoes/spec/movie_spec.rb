require 'rails_helper'
  
describe Movie do 
  describe "Add director to movie" do
    before do
      @newMovie = FactoryGirl.create(:movie)
      @newMovie.director = "James Cameron"
      @newMovie.save
      @newMovie1 = FactoryGirl.create(:movie)
      @newMovie1.save
      @newMovie2 = FactoryGirl.create(:movie)
	    @newMovie2.title = "Indiana Jones: Raiders of the Lost Ark"
	    @newMovie2.rating = "PG"
      @newMovie2.release_date = 50.years.ago
      @newMovie2.director = "Steven Spielberg"
      @newMovie2.save
	  
	    @newMovie3 = FactoryGirl.create(:movie)
	    @newMovie3.title = "Indiana Jones and the Temple of Doom"
	    @newMovie3.rating = "PG"
      @newMovie3.release_date = 40.years.ago
      @newMovie3.director = "Steven Spielberg"
      @newMovie3.save
	  
	    @newMovie4 = FactoryGirl.create(:movie)
	    @newMovie4.title = "The Incredibles"
	    @newMovie4.rating = "PG"
      @newMovie4.release_date = 14.years.ago
      @newMovie4.director = "Brad Bird"
      @newMovie4.save
    end 
  
    it "should have a director" do 
      @newMovie[:director].should == "James Cameron"
    end
    
    it "should find itself if no similar movies exist" do 
      @newMovie4.find_similar().should include(@newMovie4)
    end 
    
    it "should find movies by the same director" do 
      @newMovie2.find_similar().should include(@newMovie3)
    end 
    
    it "should find nothing if no director information" do 
      @newMovie1.find_similar().should be_nil
    end
    
  end 
end

    
