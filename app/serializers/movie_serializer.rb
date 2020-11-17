class MovieSerializer
  include FastJsonapi::ObjectSerializer

  attribute :imdbId

  attribute :title

  attribute :description, &:overview

  attribute :releaseDate

  attribute :budget do |movie|
    "$#{movie.budget}.00"
  end
  attribute :runtime

  # attribute :average_rating - could be a better fit as a relationship instead of an attribute

  attribute :genres #do |movie|
    # JSON.parse(movie.genres)
  # end

  attribute :originalLanguage, &:language

  attribute :productionCompanies
end
