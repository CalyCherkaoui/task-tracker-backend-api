class Routine < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :priority, presence: true, numericality: { only_integer: true, greater_than: 0 }
  has_many :tasks, dependent: :destroy

  scope :priority_sorted, -> { order(priority: :asc) }

  def hero_task(id)
    tasks = User.find(id).tasks.where(routine_id: self.id)
    if tasks
      tasks.priority_sorted.first
    else
      []
    end
  end

  def user_tasks(id)
    tasks = User.find(id).tasks.where(routine_id: self.id)
    tasks.priority_sorted
  end

  def tasks_count(id)
    tasks = User.find(id).tasks.where(routine_id: self.id)
    tasks.count
  end
end
