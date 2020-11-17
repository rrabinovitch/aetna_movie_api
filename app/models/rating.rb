class Rating < RatingsBase
  validates_presence_of :userId, :movieId, :rating
end
