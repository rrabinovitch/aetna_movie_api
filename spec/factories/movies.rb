FactoryBot.define do
  factory :movie do
    imdbId { "tt0094675" }
    title { "Movie Title" }
    releaseDate { "1988-10-21" }
    budget { 1000000 }
    runtime { 105 }
    genres { [{id: 18, name: "Drama"}, {id: 80, name: "Crime"}] }
  end
end
