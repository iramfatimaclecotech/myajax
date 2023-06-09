class Appointment < ApplicationRecord
    belongs_to :physician
    belongs_to :patient
    accepts_nested_attributes_for :physician
    accepts_nested_attributes_for :patient
end
