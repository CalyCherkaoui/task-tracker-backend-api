class Mesurement < ApplicationRecord
  belongs_to :task
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
