require 'spec_helper'

feature "Deleting client" do
  scenario "Deleting a client" do
    value = "Norman"
    resource = Factory(:client, :name => value)
    visit clients_url
    click_link value
    click_link "Delete"
    page.should have_content("Client has been deleted.")
    visit clients_url
    page.should_not have_content(value)
  end
end