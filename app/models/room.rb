class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
