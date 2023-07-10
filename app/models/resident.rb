class Resident < ApplicationRecord
  has_many :resident_courses
  has_many :courses, through: :resident_courses

  validates :name, presence: true
  validates :age, presence: true
  validates :occupation, presence: true

  def self.find_avg_age
    # Note: .round(2) could be considered display logic and added in the view
    average(:age).to_f.round(2)
  end
end