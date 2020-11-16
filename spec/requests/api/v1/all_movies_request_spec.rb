require 'rails_helper'

RSpec.describe 'List All Movies' do
  it 'Returns list of movies' do
    create_list(:movie, 10)

    get '/api/v1/movies'
    expect(response).to be_successful
  end
end
