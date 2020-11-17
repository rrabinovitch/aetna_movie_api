require 'rails_helper'

RSpec.describe 'List All Movies' do
  it 'Returns list of movies' do
    create_list(:movie, 10)

    get '/api/v1/movies'
    expect(response).to be_successful
    expect(response.content_type).to eq('application/json; charset=utf-8')

    movies_json = JSON.parse(response.body, symbolize_names: true)
    expect(movies_json[:data].count).to eq(10)
    expect(movies_json[:data][0]).to have_key(:id)
    expect(movies_json[:data][0][:attributes]).to have_key(:imdbId)
    expect(movies_json[:data][0][:attributes][:imdbId]).to be_a(String)
    expect(movies_json[:data][0][:attributes]).to have_key(:title)
    expect(movies_json[:data][0][:attributes][:title]).to be_a(String)
    expect(movies_json[:data][0][:attributes]).to have_key(:genres)
    # expect(movies_json[:data][0][:attributes][:genres]).to be_a(...) --- string? array?
      # array of genre names?
    expect(movies_json[:data][0][:attributes]).to have_key(:releaseDate)
    expect(movies_json[:data][0][:attributes][:releaseDate]).to be_a(String)
    expect(movies_json[:data][0][:attributes]).to have_key(:budget)
    expect(movies_json[:data][0][:attributes][:budget]).to be_an(Integer) # how to test that budget is displayed in dollars?
  end

  it 'Returns 50 movies per page' do
    movies = create_list(:movie, 55)

    get '/api/v1/movies?page=1'
    expect(response).to be_successful
    expect(response.content_type).to eq('application/json; charset=utf-8')

    movies_json = JSON.parse(response.body, symbolize_names: true)
    expect(movies_json[:data].count).to eq(50)
    expect(movies_json[:data][0][:id]).to eq(movies[0].id.to_s)
    expect(movies_json[:data][49][:id]).to eq(movies[49].id.to_s)
  end

  it 'Can accept "page" query params' do
    movies = create_list(:movie, 175)

    get '/api/v1/movies?page=2'
    expect(response).to be_successful
    expect(response.content_type).to eq('application/json; charset=utf-8')

    movies_json = JSON.parse(response.body, symbolize_names: true)
    expect(movies_json[:data].count).to eq(50)
    expect(movies_json[:data][0][:id]).to eq(movies[50].id.to_s)
    expect(movies_json[:data][49][:id]).to eq(movies[99].id.to_s)
  end
end
