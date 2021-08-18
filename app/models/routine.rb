class Routine < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :priority, presence: true, numericality: { only_integer: true, greater_than: 0 }
  has_many :tasks, dependent: :destroy

  def ordered_tasks
    tasks.ordered
  end

  def hero_task
    tasks.ordered.first
  end

  def tasks_count
    tasks.count
  end
end
