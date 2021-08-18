class Routine < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :priority, presence: true
end
