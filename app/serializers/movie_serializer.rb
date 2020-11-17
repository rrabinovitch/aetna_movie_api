class MovieSerializer
  include FastJsonapi::ObjectSerializer

  attributes :imdbId, :title, :description, :releaseDate, :budget, :runtime

  attribute :budget do |movie|
    "$#{movie.budget}.00"
  end

  attribute :genres #do |movie|
    # JSON.parse(movie.genres)
  # end

  attribute :original_language, &:language
end
