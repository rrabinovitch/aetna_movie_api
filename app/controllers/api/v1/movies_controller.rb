class Api::V1::MoviesController < ApplicationController
  def index
    page = params[:page]
    movies = Movie.all.paginate(page: page, per_page: 50)
    render json: MovieSerializer.new(movies)
  end
end
