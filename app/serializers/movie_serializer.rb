class MovieSerializer
  include FastJsonapi::ObjectSerializer

  attribute :imdbId, :title, :releaseDate, :runtime, :productionCompanies

  attribute :description, &:overview
  attribute :originalLanguage, &:language

  attribute :budget do |movie|
    "$#{movie.budget}.00"
  end

  # attribute :average_rating - could be a better fit as a relationship instead of an attribute

  attribute :genres #do |movie|
    # JSON.parse(movie.genres)
  # end

end
