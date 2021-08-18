class Task < ApplicationRecord
  belongs_to :routine
  belongs_to :user
  validates :name, presence: true, length: { minimum: 1 }
  validates :unit, :priority, :goal, presence: true
end
