class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  validates :username, presence: true, length: { minimum: 2 }

  has_many :tasks

  def sorted_tasks
    tasks.priority_sorted
  end
end
