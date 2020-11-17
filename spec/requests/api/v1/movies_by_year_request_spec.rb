require 'rails_helper'

RSpec.describe 'Movies By Year' do
  before :each do
    @movie_1 = create(:movie, releaseDate: "1988-11-27")
    @movie_2 = create(:movie, releaseDate: "1988-12-01")
    @movie_3 = create(:movie, releaseDate: "1988-10-27")
    @movie_4 = create(:movie, releaseDate: "1988-10-21")
    @movie_5 = create(:movie, releaseDate: "1990-02-19")
    @movie_6 = create(:movie, releaseDate: "1990-04-29")
  end

  it 'Returns a list of all movies from a particular year' do
    get '/api/v1/movies?year=1988'
    expect(response).to be_successful
    expect(response.content_type).to eq('application/json; charset=utf-8')

    movies_json = JSON.parse(response.body, symbolize_names: true)
    expect(movies_json[:data].count).to eq(4)

    movies_json[:data].each do |movie_data|
      expect(movie_data[:attributes][:releaseDate]).to include("1988")
    end

    expect(movies_json[:data][0]).to have_key(:id)
    expect(movies_json[:data][0]).to have_key(:type)
    expect(movies_json[:data][0][:type]).to eq("movie")
    expect(movies_json[:data][0][:attributes]).to have_key(:imdbId)
    expect(movies_json[:data][0][:attributes][:imdbId]).to be_a(String)
    expect(movies_json[:data][0][:attributes]).to have_key(:title)
    expect(movies_json[:data][0][:attributes][:title]).to be_a(String)
    expect(movies_json[:data][0][:attributes]).to have_key(:genres)
    expect(movies_json[:data][0][:attributes][:genres]).to be_a(String)
    expect(movies_json[:data][0][:attributes]).to have_key(:releaseDate)
    expect(movies_json[:data][0][:attributes][:releaseDate]).to be_a(String)
    expect(movies_json[:data][0][:attributes]).to have_key(:budget)
    expect(movies_json[:data][0][:attributes][:budget]).to be_a(String)
    expect(movies_json[:data][0][:attributes][:budget]).to include("$")
  end

  it 'Returns the filtered movies in descending chronological year order' do
    get '/api/v1/movies?year=1988'
    expect(response).to be_successful
    expect(response.content_type).to eq('application/json; charset=utf-8')

    movies_json = JSON.parse(response.body, symbolize_names: true)
    expect(movies_json[:data].count).to eq(4)

    expect(movies_json[:data][0][:id]).to eq(@movie_2.id.to_s)
    expect(movies_json[:data][1][:id]).to eq(@movie_1.id.to_s)
    expect(movies_json[:data][2][:id]).to eq(@movie_3.id.to_s)
    expect(movies_json[:data][3][:id]).to eq(@movie_4.id.to_s)
  end

  # it 'Returns 50 movies per page' do
  #   create_list(:movie, 75)
  #
  #   get '/api/v1/movies?year=1988'
  #   expect(response).to be_successful
  #   expect(response.content_type).to eq('application/json; charset=utf-8')
  #
  #   movies_json = JSON.parse(response.body, symbolize_names: true)
  #   expect(movies_json[:data].count).to eq(50)
  #
  #   movies_json[:data].each do |movie_data|
  #     expect(movie_data[:attributes][:releaseDate]).to include("1988")
  #   end
  # end
end
