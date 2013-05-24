require 'spec_helper'

feature 'Creating Clients' do
  
  before do
    visit clients_url
    click_link 'New Client'
  end    

  scenario "can create a client" do
    fill_in 'Name', :with => 'Miles'
    click_button 'Create Client'
    page.should have_content('Client was successfully created.')
  end
  
  scenario "can not create a client without a name" do
    click_button 'Create Client'
    page.should have_content("Client has not been created.")
    page.should have_content("Name can't be blank")
  end

end
