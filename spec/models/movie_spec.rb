require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :imdbId }
    it { should validate_presence_of :title }
    it { should validate_presence_of :genres }
    it { should validate_presence_of :releaseDate }
    it { should validate_presence_of :budget }
  end

  describe 'relationships' do
    # it { should have_many :ratings } - ratings db not yet configed
  end
end
