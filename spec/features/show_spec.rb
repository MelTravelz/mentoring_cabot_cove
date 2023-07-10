require 'rails_helper'

RSpec.describe "/residents/:id", type: :feature do
  describe "when I visit the residents show page" do
    before(:each) do
      @jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")

      # Option 1:
      # @course1 = @jessica.courses.create!(name: "Crime Scenes")
      # @course2 = @jessica.courses.create!(name: "Fingerprinting")

      # Option 2:
      @course1 = Course.create!(name: "Crime Scenes")
      @course2 = Course.create!(name: "Fingerprinting")
      ResidentCourse.create!(resident_id: @jessica.id, course_id: @course1.id)
      ResidentCourse.create!(resident_id: @jessica.id, course_id: @course2.id)
    end

    it "displays resident name & list of courses" do
      visit "/residents/#{@jessica.id}"

      expect(page).to have_content("#{@jessica.name}")
      expect(page).to have_content("Courses:") 
      expect(page).to have_content("- #{@course1.name}")
      expect(page).to have_content("- #{@course2.name}")
    end
  end
end

    