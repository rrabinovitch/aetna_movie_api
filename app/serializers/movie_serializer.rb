class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :imdbId, :title, :genres, :releaseDate, :budget
end
