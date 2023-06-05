class Review < ApplicationRecord
 belongs_to :card

#  validates :rating, presence: true, numericality:
#  { greater_than_or_equal_to: 1, less_than_or_equal_to: 5,
#    only_integer: true }

#     after_commit :update_reviewable_rating, on: [:create, :update, :destroy]

#    def update_reviewable_rating
#     reviewable.update! average_rating: reviewable.reviews.average(:rating)
#     # avg + (rating - avg) / count
#   end
end
