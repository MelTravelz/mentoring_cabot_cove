require "rails_helper"

RSpec.describe Resident, type: :model do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :occupation }
  end

  describe "relationships" do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end

  describe "class methods" do
    before(:each) do
      @jessica = Resident.create(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
      @seth = Resident.create(name: "Seth Hazlitt", age: 70, occupation: "Town Doctor")
    end 

    describe ":find_avg_age" do
      it "returns the average age of all residents" do
        expect(Resident.find_avg_age).to eq(67.5)

        @mark = Resident.create(name: "Mark Markerson", age: 28, occupation: "Graduate Student")

        # Note: If .round(2) is considered display logic and added in the view, 
        # you'll need to add it in the test: Resident.find_avg_age.round(2)
        expect(Resident.find_avg_age).to eq(54.33)
      end
    end

    describe ":alphabetize" do #find this method in the application_record.rb file! 
      it "orders all residents by name alphabetically" do
        @zeva = Resident.create(name: "Zeva Zelington", age: 40, occupation: "Graduate Student")
        @andy = Resident.create(name: "Andy Markerson", age: 26, occupation: "Graduate Student")

        expect(Resident.alphabetize).to eq([@andy, @jessica, @seth, @zeva])
      end
    end
  end
end