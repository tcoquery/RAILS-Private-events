class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :invitations, foreign_key: "attended_event_id"
  has_many :attendees, through: :invitations

  validates :title, :location, :description, :event_date, presence: true
end
