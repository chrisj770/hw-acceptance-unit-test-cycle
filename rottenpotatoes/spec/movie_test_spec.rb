require 'spec_helper'
  
describe MoviesController do 
  describe "Add director to movie" do
    before do
      FactoryGirl.create(:movie)
    end 
    
    
