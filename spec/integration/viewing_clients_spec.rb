require 'spec_helper'

feature "Viewing clients" do
  scenario "Listing all clients" do
    client = Factory.create(:client, :name => "Joe")
    visit clients_url
    click_link client.name
    page.current_url.should == client_url(client)
  end
end