require 'rails_helper'
  
describe Movie do 
  describe "Add director to movie" do
    before do
      @newMovie = FactoryGirl.create(:movie)
      @newMovie.director = "James Cameron"
      @newMovie.save
      @newMovie1 = FactoryGirl.create(:movie)
      @newMovie1.save
      @newMovie2 = FactoryGirl.create(:indiana_jones_1)
      @newMovie2.save
      @newMovie3 = FactoryGirl.create(:indiana_jones_2)
      @newMovie3.save
      @newMovie4 = FactoryGirl.create(:the_incredibles)
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

    
