class Resource < ApplicationRecord
    has_many :creators

searchable do
    text :title, :default_boost => 2
    text :description
    text :creators do     # for associations
      creators.map { |creator| creator.name }
    end
    text :tag_list, :default_boost => 2
    time :created_at
  end
end