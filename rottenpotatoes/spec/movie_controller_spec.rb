require 'rails_helper'
  
describe MoviesController do 
  describe "Page Responses", :type => :request do
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
  
    it "should get movies page" do
      get "/movies"
      expect(response).to render_template(:index)
      expect(assigns(:all_ratings)).to eq(Movie.all_ratings)
    end
    
    it "should get a sorted movies page" do 
      get "/movies", :params => {:sort => "title"}
      expect(response).to render_template(:index)
      
      get "/movies", :params => {:sort => "title"}
      expect(response).to render_template(:index)
      
    end 
    
    
    it "should get movies page with proper params" do 
      get "/movies/1"
      expect(response).to render_template(:show)
      
    end 
    
    it "should get a new movies page when requested" do 
      get "/movies/new"
      expect(response).to render_template(:new)
    end
    
    it "should get an edit-movie page" do 
      get "/movies/1/edit"
      expect(response).to render_template(:edit)
    end
    
    
    it "should respond to parameters" do 
      get "/movies", :params => {:ratings => ['NC-17']}
      expect(response).to render_template(:index)
      
    end 

    
  end
end

    
