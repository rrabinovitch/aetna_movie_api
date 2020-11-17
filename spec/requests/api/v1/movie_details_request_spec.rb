require 'rails_helper'

RSpec.describe 'Movie Details' do
  it 'Returns movie details for a particular movie' do
    movie = create(:movie)

    get "/api/v1/movies/#{movie.id}"
    expect(response).to be_successful
    expect(response.content_type).to eq('application/json; charset=utf-8')

    movie_json = JSON.parse(response.body, symbolize_names: true)
    expect(movie_json[:data]).to have_key(:id)
    expect(movie_json[:data][:id]).to eq(movie.id.to_s)
    expect(movie_json[:data]).to have_key(:type)
    expect(movie_json[:data][:type]).to eq("movie")
    expect(movie_json[:data][:attributes]).to have_key(:imdbId)
    expect(movie_json[:data][:attributes][:imdbId]).to be_a(String)
    expect(movie_json[:data][:attributes][:imdbId]).to eq(movie.imdbId)
    expect(movie_json[:data][:attributes]).to have_key(:title)
    expect(movie_json[:data][:attributes][:title]).to be_a(String)
    expect(movie_json[:data][:attributes][:title]).to eq(movie.title)
    expect(movie_json[:data][:attributes]).to have_key(:releaseDate)
    expect(movie_json[:data][:attributes][:releaseDate]).to be_a(String)
    expect(movie_json[:data][:attributes][:releaseDate]).to eq(movie.releaseDate)
    expect(movie_json[:data][:attributes]).to have_key(:budget)
    expect(movie_json[:data][:attributes][:budget]).to be_a(String)
    expect(movie_json[:data][:attributes][:budget]).to include("$")
    expect(movie_json[:data][:attributes]).to have_key(:genres)
    expect(movie_json[:data][:attributes][:genres]).to be_a(String)
    expect(movie_json[:data][:attributes][:genres]).to eq(movie.genres)
  end
end
