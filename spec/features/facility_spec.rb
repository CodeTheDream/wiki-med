require 'rails_helper'

RSpec.feature "Facilities", type: :feature do
    it "should create a facility", js: true do
    visit '/facilities'
    save_screenshot('first.png')
    find("a[href='#{new_facility_path}']").click
    sleep 2
    save_screenshot('second.png')
    fill_in "Name of Facility", with: "Uncg"
    fill_in "Street Address", with: "400 Spring Garden St"
    fill_in "City", with: "Greensboro"
    fill_in "State", with: "NC"
    fill_in "ZIP Code", with: "27708"
    fill_in "Speciality of Facility", with: "NC"
    save_screenshot('third.png')
    click_on("Post")
    sleep 1
    facility = Facility.first
    expect(facility.name).to(eq('Uncg'))
    save_screenshot('fourth.png')
  end
end

