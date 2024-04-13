class Event < ApplicationRecord
  belongs_to :user
  has_many :rsvps
  validates :name, presence: true
  validates :email, presence: true
end
