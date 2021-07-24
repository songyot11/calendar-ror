class Calendar < ApplicationRecord
  validates :event_name, :start_at, :end_at, presence: true
end
