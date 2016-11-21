require "spec_helper"

describe MoviesController do
  #it { should respond_to(:find_movies_by_same_director) }

  describe "searching for movies by the same director" do
   	context "when 'Director' info exists" do
   		before do
   		  @movie = double("Star Wars", {:id => "1", :director => "George Lucas"})
        Movie.stub(:find).with("1").and_return @movie
   		  @lucas_films = ["Star Wars", "THX-1138"]
        @movie.stub(:director).and_return @lucas_films
   		end
      it "should post @director and @movies variables for view" do
    	  get :find_movies_by_same_director, :id => @movie.id
        assigns(:director).should == @movie.director
      end
      it "should render the view of movies by the director" do
        get :find_movies_by_same_director, :id => @movie.id
        response.should render_template :director
      end
   	end
    context "when 'Director' doesn't exist" do
      before do
        @movie = double("movie", {:id => "1", :title => "Non-exist Movie", :director => nil})
        Movie.stub(:find).with("1").and_return @movie
        @movie.stub(:director).and_return(nil)
      end
      it "should redirect to the home page with a message saying that no movies exist" do
        get :find_movies_by_same_director, :id => 1
        flash[:notice].should == "'#{@movie.title}' has no director info"
        response.should redirect_to(root_path)
      end
    end
 	end
end