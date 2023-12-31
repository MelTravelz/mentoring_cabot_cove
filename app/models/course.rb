class Course < ApplicationRecord
  has_many :resident_courses
  has_many :residents, through: :resident_courses

  validates_presence_of :name

  def total_resident_count
    residents.size 
  end
end