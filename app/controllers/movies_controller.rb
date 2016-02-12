class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = Movie.search(params[:search]).order("created_at DESC")
    else
      @movies = Movie.order("created_at DESC")
    end
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id

   respond_to do |format|


       if @movie.save
         format.html { redirect_to @movie, notice: 'Ticket was successfully created.' }
         format.json { render :show, status: :created, location: @movie }
       else
         format.html { render :new }
         format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    respond_to do |format|
      format.html {redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :actor, :genre)
  end
end
