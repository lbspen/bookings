require 'spec_helper'

feature 'Creating Clients' do
  scenario "can create a client" do
    visit '/'
    click_link 'New Client'
    fill_in 'Name', :with => 'Miles'
    click_button 'Create Client'
    page.should have_content('Client was successfully created.')
  end
  
  scenario "can not create a client without a name" do
    visit '/'
    click_link 'New Client'
    click_button 'Create Client'
    page.should have_content("Client has not been created.")
    page.should have_content("Name can't be blank")
  end

end
