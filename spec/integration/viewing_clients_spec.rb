require 'spec_helper'

feature "Viewing clients" do
  let!(:client) { Factory.create(:client, :name => "Joe") }
  scenario "Listing all clients" do
    visit clients_url
    click_link client.name
    page.current_url.should == client_url(client)
  end

  scenario "Viewing engineers associated with a client" do
    booking1 = Factory.create(:booking, :client => client)
    engineer = Factory.create(:engineer, :name => "Sam" )
    booking2 = Factory.create(:booking, :client => client, :engineer => engineer)
    visit clients_url
    click_link client.name
    page.should have_content(client.name)
    page.should have_content(booking1.engineer.name)    
    page.should have_content(booking2.engineer.name)
  end
end