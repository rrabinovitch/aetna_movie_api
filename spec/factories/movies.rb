FactoryBot.define do
  factory :movie do
    imdbId { "tt0094675" }
    title { "Movie Title" }
    overview { "This is the movie description." }
    productionCompanies { [{name: "Production Co.", "id": 111}, {"name": "Production Group Inc.", "id": 222}] }
    releaseDate { "1988-10-21" }
    budget { 1000000 }
    runtime { 105 }
    language { "English" }
    genres { [{id: 18, name: "Drama"}, {id: 80, name: "Crime"}] }
  end
end
