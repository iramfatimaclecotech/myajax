class Card < ApplicationRecord
    has_many_attached :images

    has_many :reviews
end
