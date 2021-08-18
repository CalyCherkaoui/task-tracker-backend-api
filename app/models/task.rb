class Task < ApplicationRecord
  belongs_to :routine
  belongs_to :user
end
