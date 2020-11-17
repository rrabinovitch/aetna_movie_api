class Api::V1::MoviesController < ApplicationController
  def index
    if params[:page]
      page = params[:page]
      movies = Movie.all.paginate(page: page, per_page: 50)
    elsif params[:year]
      movies = Movie.where("movies.releaseDate LIKE ?", "%#{params[:year]}%")

      binding.pry
    end
    render json: MovieSerializer.new(movies, { fields: { movie: [:imdbId, :title, :genres, :releaseDate, :budget] } })
  end

  def show
    movie = Movie.find(params[:id])
    render json: MovieSerializer.new(movie, { fields: { movie: [:imdbId, :title, :description, :releaseDate, :budget, :runtime, :genres, :originalLanguage, :productionCompanies] } })
  end
end
