require 'spec_helper'

feature "Creating Bookings -" do 
  let!(:engineer) { Factory.create(:engineer, :name => "Chris") }
  let!(:client) { Factory.create(:client, :name => "Diva") }

  scenario "Creating a booking" do
    visit "/"
    click_link "New Booking"
    select(engineer.name, :from => "Engineer")
    select(client.name, :from => "Client")
    fill_in "Cost", :with => "100"
    click_button "Create Booking"
    page.should have_content("Booking has been created.")
    page.should have_content(engineer.name)
    page.should have_content(client.name)
    page.should have_content("100.00")
  end

  scenario "Invalid cost" do
    pending "check invalid cost in booking"
  end
end