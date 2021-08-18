class Task < ApplicationRecord
  belongs_to :routine
  belongs_to :user
  has_many :mesurements, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :unit, :goal, presence: true
  validates :priority, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :priority_sorted, -> { order(priority: :asc).includes(:routine) }

  def icon
    routine.icon
  end
end
