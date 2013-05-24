require 'spec_helper'

feature "Deleting engineer" do
  scenario "Deleting a engineer" do
    value = "Mixalot"
    resource = Factory(:engineer, :name => value)
    visit engineers_url
    click_link value
    click_link "Delete"
    page.should have_content("Engineer has been deleted.")
    visit engineers_url
    page.should_not have_content(value)
  end
end