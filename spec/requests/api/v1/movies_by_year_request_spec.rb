require 'rails_helper'

RSpec.describe 'Movies By Year' do
  it 'Returns a list of all movies from a particular year' do
    movie_1 = create(:movie, releaseDate: "1988-10-21")
    movie_2 = create(:movie, releaseDate: "1988-10-27")
    movie_3 = create(:movie, releaseDate: "1988-11-27")
    movie_4 = create(:movie, releaseDate: "1988-12-01")
    movie_5 = create(:movie, releaseDate: "1990-02-19")
    movie_6 = create(:movie, releaseDate: "1990-04-29")

    get '/api/v1/movies?year=1988'
    expect(response).to be_successful
    expect(response.content_type).to eq('application/json; charset=utf-8')

    movies_json = JSON.parse(response.body, symbolize_names: true)
    expect(movie_json[:data].count).to eq(4)

    movies_json[:data].each do |movie_data|
      expect(movie_data[:attributes][:releaseDate]).to include("1988")
    end

    expect(movies_json[:data]).to include(movie_1)
    expect(movies_json[:data]).to include(movie_2)
    expect(movies_json[:data]).to include(movie_3)
    expect(movies_json[:data]).to include(movie_4)
    expect(movies_json[:data]).to not_include(movie_5)
    expect(movies_json[:data]).to not_include(movie_6)
  end

  # it 'Returns 50 movies per page' do
  #
  # end
end
