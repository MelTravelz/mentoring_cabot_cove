require 'rails_helper'

RSpec.describe "/residents", type: :feature do
  describe "when I visit the residents index page" do
    before(:each) do
      @jessica = Resident.create(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
      @seth = Resident.create(name: "Seth Hazlitt", age: 70, occupation: "Town Doctor")
    end
    
    it "displays all residents & their attributes" do
      visit "/residents"

      # expect(page).to have_content("Name: Jessica Fletcher, Age: 65, Occupation: Mystery Writer")
      # expect(page).to have_content("Name: Dr. Seth Hazlitt, Age: 70, Occupation: Town Doctor")
      expect(page).to have_content("Name: #{@jessica.name}, Age: #{@jessica.age}, Occupation: #{@jessica.occupation}")
      expect(page).to have_content("Name: #{@seth.name}, Age: #{@seth.age}, Occupation: #{@seth.occupation}")
    end

    it "displays the average age of all residents" do
      visit "/residents"

      expect(page).to have_content("Average Age: 67.5")
    end

    it "displays all residents in alphabetical order" do
      andy = Resident.create(name: "Andy Markerson", age: 26, occupation: "Graduate Student")

      visit "/residents"

      # Here we are using the Orderly gem:
      expect(andy.name).to appear_before(@jessica.name)
      expect(@jessica.name).to appear_before(@seth.name)
    end
  end
end