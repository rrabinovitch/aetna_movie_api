class MovieSerializer
  include FastJsonapi::ObjectSerializer

  attributes :imdbId, :title, :releaseDate, :budget

  attribute :genres do |movie|
    JSON.parse(movie.genres)
  end
end
