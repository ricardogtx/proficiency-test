class Course < ActiveRecord::Base
  has_many :classrooms
  has_many :students, through: :classrooms

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :status, presence: true

end
