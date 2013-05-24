require 'spec_helper'

feature "Editing Clients" do
  before do
    client = Factory(:client, :name => "Louelle")
    visit clients_url
    click_link client.name
    click_link "Edit"
  end    

  scenario "Updating a client" do
    fill_in "Name", :with => "Lisa"
    click_button "Update"
    page.should have_content("Client has been updated.")
  end

  scenario "Updating a client with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Client"
    page.should have_content("Client has not been updated.")
  end
end