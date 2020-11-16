class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :imdbId, :title, :genres, :releaseDate, :budget
end
