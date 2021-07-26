class Calendar < ApplicationRecord
  validates :event_name, :start_at, :end_at, :tag_color, presence: true
end
