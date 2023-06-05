require 'csv'
class Shark < ApplicationRecord
    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |shark|
            csv << shark.attributes.values_at(*column_names)
          end
        end
    end
end

