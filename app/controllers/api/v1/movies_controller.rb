class Api::V1::MoviesController < ApplicationController
  def index
    year = params[:year]
    if year
      if year.to_i <= 0
        render json: { status: 400, error_message: "Specified year must be an integer over 0." }, status: :bad_request
        return
      end
      movies = Movie.filter_movies_by_year(year).paginate(page: params[:page], per_page: 50) #where("movies.releaseDate LIKE ?", "%#{params[:year]}%").order(releaseDate: :desc).paginate(page: params[:page], per_page: 50)
    else
      movies = Movie.all.paginate(page: params[:page], per_page: 50)
    end
    render json: MovieSerializer.new(movies, { fields: { movie: [:imdbId, :title, :genres, :releaseDate, :budget] } })
    # save per_page value as var at top to minimize # of changes potentially needed (same w params[:page])
  end

  def show
    movie = Movie.find(params[:id])
    render json: MovieSerializer.new(movie, { fields: { movie: [:imdbId, :title, :description, :releaseDate, :budget, :runtime, :genres, :originalLanguage, :productionCompanies] } })
  end
end
