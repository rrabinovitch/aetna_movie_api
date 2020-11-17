class MoviesSerializer
  include FastJsonapi::ObjectSerializer

  attributes :imdbId, :title, :releaseDate, :budget

  attribute :genres #do |movie|
    # JSON.parse(movie.genres)
#  end

  attribute :budget do |movie|
    "$#{movie.budget}.00"
  end
end
