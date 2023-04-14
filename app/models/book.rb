class Book < ApplicationRecord
    validates_presence_of :title, :isbn

    searchable do
      text :title
    end
end
