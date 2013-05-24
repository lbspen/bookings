require 'spec_helper'

feature 'Creating Engineers' do
  before do
    visit engineers_url
    click_link 'New Engineer'
  end

  scenario "can create a engineer" do
    fill_in 'Name', :with => 'Chris'
    click_button 'Create Engineer'
    page.should have_content('Engineer was successfully created.')
  end
  
  scenario "can not create a engineer without a name" do
    click_button 'Create Engineer'
    page.should have_content("Engineer has not been created.")
    page.should have_content("Name can't be blank")
  end

end
