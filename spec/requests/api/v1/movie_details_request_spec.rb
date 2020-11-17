require 'rails_helper'

RSpec.describe 'Movie Details' do
  it 'Returns movie details for a particular movie' do
    movie = create(:movie)

    get "/api/v1/movies/#{movie.id}"
    expect(response).to be_successful
    expect(response.content_type).to eq('application/json; charset=utf-8')

    movie_json = JSON.parse(response.body, symbolize_names: true)
  end
end
