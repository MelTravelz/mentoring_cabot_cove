require 'rails_helper'

RSpec.describe "/courses", type: :feature do
  describe "when I visit the courses index page" do
    before(:each) do
      @jessica = Resident.create(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
      @seth = Resident.create(name: "Seth Hazlitt", age: 70, occupation: "Town Doctor")
      @mark = Resident.create(name: "Mark Markerson", age: 28, occupation: "Graduate Student")

      @course1 = Course.create!(name: "Crime Scenes")
      @course2 = Course.create!(name: "Fingerprinting")
      @course3 = Course.create!(name: "Anatomy")
      
      ResidentCourse.create!(resident_id: @jessica.id, course_id: @course1.id)
      ResidentCourse.create!(resident_id: @seth.id, course_id: @course1.id)
      ResidentCourse.create!(resident_id: @mark.id, course_id: @course1.id)

      ResidentCourse.create!(resident_id: @jessica.id, course_id: @course2.id)
      ResidentCourse.create!(resident_id: @mark.id, course_id: @course2.id)

      ResidentCourse.create!(resident_id: @jessica.id, course_id: @course3.id)

      visit "/courses"
    end

    it "displays all courses" do
      expect(page).to have_content("Courses: Total Enrolled")
      expect(page).to have_content("#{@course1.name}: 3")
      expect(page).to have_content("#{@course2.name}: 2")
      expect(page).to have_content("#{@course3.name}: 1")

      # Alternative: 
      # expect(page).to have_content("#{@course1.name}: #{@course1.residents.size}")
    end

    it "displays all courses in alphabetical order" do
      # Here we are using the Orderly gem:
      expect(@course3.name).to appear_before(@course1.name)
      expect(@course1.name).to appear_before(@course2.name)
    end
  end
end
