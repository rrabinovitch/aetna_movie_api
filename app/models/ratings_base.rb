class RatingsBase < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :ratings, reading: :ratings_replica }
end
