require 'rails_helper'


RSpec.feature "Facilities", type: :feature do
    it "should create a facility", js: true  do
      visit '/facilities'
      save_screenshot('first.png')
      find("a[href='#{new_facility_path}']").click
      sleep 2
      save_screenshot('second.png')
      fill_in "Name", with: "Uncg"
      fill_in "Street", with: "400 Spring Garden St"
      fill_in "City", with: "Greensboro"
      fill_in "State", with: "NC"
      fill_in "Zip", with: "27708"
      fill_in "Specialty", with: "NC"
      save_screenshot('Third.png')
      click_on("Submit")
      sleep 1
      facility = Facility.first
      expect(facility.name).to(eq('Uncg'))
      save_screenshot('fourth.png')
    end
#    scenario 'visit /facilities' do
#      visit '/facilities'
#      expect(current_path).to eq facilities_path
#    end
end

