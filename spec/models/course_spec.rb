require "rails_helper"

RSpec.describe Course, type: :model do

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :resident_courses }
    it { should have_many(:residents).through(:resident_courses) }
  end

  describe "instance methods" do
    before(:each) do
      @jessica = Resident.create(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
      @seth = Resident.create(name: "Seth Hazlitt", age: 70, occupation: "Town Doctor")
      @mark = Resident.create(name: "Mark Markerson", age: 28, occupation: "Graduate Student")

      @course1 = Course.create!(name: "Crime Scenes")
      @course2 = Course.create!(name: "Fingerprinting")
      @course3 = Course.create!(name: "Medical Documentation")
      
      ResidentCourse.create!(resident_id: @jessica.id, course_id: @course1.id)
      ResidentCourse.create!(resident_id: @seth.id, course_id: @course1.id)
      ResidentCourse.create!(resident_id: @mark.id, course_id: @course1.id)

      ResidentCourse.create!(resident_id: @jessica.id, course_id: @course2.id)
      ResidentCourse.create!(resident_id: @mark.id, course_id: @course2.id)
    end

    describe "#total_resident_count" do
      it "returns the total count of all residents in a course" do
        expect(@course1.total_resident_count).to eq(3)
        expect(@course2.total_resident_count).to eq(2)
        expect(@course3.total_resident_count).to eq(0)
      end
    end
  end
end