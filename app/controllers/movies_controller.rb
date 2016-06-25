class MoviesController < ApplicationController

  def index
    @duration_options = [
      [],
      ['Under 90 minutes', 1],
      ['Between 90 and 120 minutes', 2],
      ['Over 120 minutes', 3],
    ]
    
    @movies = Movie.all.page(params[:page]).per(10)
    if(params[:search])
      @movies = @movies.where("title LIKE ?", "%#{params[:search][:title]}%") if(params[:search][:title] && !params[:search][:title].empty?)
      @movies = @movies.where("director LIKE ?", "%#{params[:search][:director]}%") if(params[:search][:director] && !params[:search][:director].empty?)
      @movies = case params[:search][:runtime_in_minutes]
      when "1"
        @movies.where("runtime_in_minutes < 90")
      when "2"
        @movies.where("90 < runtime_in_minutes < 120")
      when "3"
        @movies.where("runtime_in_minutes > 120")
      else
        @movies
      end
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :description, :image)
  end
end
