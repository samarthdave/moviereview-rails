class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :is_owner, only: [:edit, :update, :destroy]

  def index
    @movies = Movie.all.order('created_at DESC')
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      flash[:success] = 'Movie was successfully created.'
      redirect_to @movie
    else
      flash[:danger] = 'Could not save the movie.'
      render 'new'
    end
  end

  def update
    if @movie.update(movie_params)
      flash[:success] = "\"#{@movie.title}\" was edited."
      redirect_to @movie
    else
      flash[:danger] = "Movie was not edited."
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    flash[:success] = 'Movie was successfully deleted.'
    redirect_to movies_url
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :length, :director, :rating, :image_url)
    end
    
    def is_owner
      if current_user != @movie.user
        flash[:danger] = "You don't have the permission to do that."
        redirect_to @movie
      end
    end
end
