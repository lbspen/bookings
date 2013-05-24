require 'spec_helper'

feature "Editing Engineers" do
  before do
    engineer = Factory(:engineer, :name => "Chris")
    visit engineers_url
    click_link engineer.name
    click_link "Edit"
  end    

  scenario "Updating a engineer" do
    fill_in "Name", :with => "Tom"
    click_button "Update"
    page.should have_content("Engineer has been updated.")
  end

  scenario "Updating a engineer with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Engineer"
    page.should have_content("Engineer has not been updated.")
  end
end