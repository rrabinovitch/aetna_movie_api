class Movie < ApplicationRecord
  validates_presence_of :imdbId, :title, :genres, :releaseDate, :budget

  def self.filter_movies_by_year(year, sort = "asc")
    Movie.where("movies.releaseDate LIKE ?", "%#{year}%").order(releaseDate: sort)
  end
end
