require 'rails_helper'

describe MoviesHelper do 
  include MoviesHelper
  
  describe "Check oddness" do 
    it "should return an odd" do 
      oddness(1).should == "odd"
    end
  end 
  
end