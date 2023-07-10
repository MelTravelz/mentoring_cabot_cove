class Resident < ApplicationRecord
  has_many :resident_courses
  has_many :courses, through: :resident_courses

  validates :name, presence: true
  validates :age, presence: true
  validates :occupation, presence: true
end