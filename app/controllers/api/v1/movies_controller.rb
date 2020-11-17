class Api::V1::MoviesController < ApplicationController
  def index
    if params[:year]
      movies = Movie.where("movies.releaseDate LIKE ?", "%#{params[:year]}%").order(releaseDate: :desc).paginate(page: params[:page], per_page: 50)
    else
      movies = Movie.all.paginate(page: params[:page], per_page: 50)
    end
    render json: MovieSerializer.new(movies, { fields: { movie: [:imdbId, :title, :genres, :releaseDate, :budget] } })
  end

  def show
    movie = Movie.find(params[:id])
    render json: MovieSerializer.new(movie, { fields: { movie: [:imdbId, :title, :description, :releaseDate, :budget, :runtime, :genres, :originalLanguage, :productionCompanies] } })
  end
end
