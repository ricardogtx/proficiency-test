class Student < ActiveRecord::Base
  has_many :classrooms
  has_many :courses, through: :classrooms

  validates :name, presence: true, uniqueness: true
  validates :register_number, presence: true, uniqueness: true
  validates :status, presence: true
end
