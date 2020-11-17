class Movie < ApplicationRecord
  validates_presence_of :imdbId, :title, :genres, :releaseDate, :budget
end
