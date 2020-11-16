FactoryBot.define do
  factory :movie do
    imdbId { "MyText" }
    title { "Movie Title" }
    overview { "MyText" }
    productionCompanies { "MyText" }
    releaseDate { "MyText" }
    budget { 1 }
    revenue { 1 }
    runtime { 1 }
    language { "MyText" }
    genres { "MyText" }
    status { "MyText" }
  end
end
