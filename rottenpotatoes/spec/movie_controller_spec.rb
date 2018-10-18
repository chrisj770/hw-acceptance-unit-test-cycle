require 'rails_helper'
  
describe MoviesController do 
  describe "Page Responses", :type => :request do
    before do
     
      #@newMovie = FactoryGirl.create(:movie)
      #@newMovie.director = "James Cameron"
      #@newMovie.save
      #@newMovie1 = FactoryGirl.create(:movie)
      #@newMovie1.save
      #@newMovie2 = FactoryGirl.create(:indiana_jones_1)
      #@newMovie2.save
      #@newMovie3 = FactoryGirl.create(:indiana_jones_2)
      #@newMovie3.save
      #@newMovie4 = FactoryGirl.create(:the_incredibles)
      #@newMovie4.save
      
      
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
  
    it "should get the main movies page" do
      get "/movies"
      expect(response).to render_template(:index)
      expect(assigns(:all_ratings)).to eq(Movie.all_ratings) 
    end
    
    it "should redirect to /movies from the root" do 
      get "/"
      expect(response).to redirect_to("/movies")
    end 
    
    it "should get a sorted movies page" do 
      get "/movies", :params => {:sort => "title"}
      expect(response).to render_template(:index)
      
      get "/movies", :params => {:sort => "release_date"}
      expect(response).to render_template(:index)
    end 
    
    it "should show a certain movie's page" do 
      get "/movies/1"
      expect(response).to render_template(:show)
    end 
    
    #it "should show movies of selected ratings" do 
    #  get "/movies", :params => {:ratings => ['NC-17']}
    #  expect(response).to render_template(:index)
    #  expect(assigns(:selected_ratings)).to include('NC-17')
    #end 
    
    it "should render a similar directors page" do
      get "/movies/1/director"
      expect(response).to render_template(:similar)
    end 
    

    
    #CRUD
    it "should show a new movie page" do 
      get "/movies/new"
      expect(response).to render_template(:new)
    end
    
    it "should create movies" do 
      post "/movies", :movie => {:title => "Simpsons"} 
      expect(Movie.where(:title => "Simpsons")).to_not be_empty 
    end
    
    it "should get an edit movie page" do 
      get "/movies/1/edit"
      expect(response).to render_template(:edit)
    end
    
    it "should update a movie" do 
      put "/movies/1", :movie => {:title => "The LEGO Movie"}
      expect(Movie.where(:title=>"The LEGO Movie")).to_not be_empty
    end
    
    it "should destroy a movie" do 
      post "/movies", :movie => {:title => "Simpsons"} 
      query = Movie.where(:title => "Simpsons")
      expect(query).to_not be_empty
      number = query.first.id
      delete "/movies/#{number}"
      expect(Movie.where(:title => "Simpsons")).to be_empty
    end
    
  end
end

    
