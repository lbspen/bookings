require 'spec_helper'

feature "Creating Bookings -" do 
  let!(:engineer) { Factory.create(:engineer, :name => "Chris") }
  let!(:client) { Factory.create(:client, :name => "Diva") }

  before do
    visit "/"
    click_link "New Booking"
    select(engineer.name, :from => "Engineer")
    select(client.name, :from => "Client")
  end
  
  scenario "Creating a booking" do
    fill_in "Cost", :with => "100"
    click_button "Create Booking"
    page.should have_content("Booking has been created.")
    page.should have_content(engineer.name)
    page.should have_content(client.name)
    page.should have_content("100.00")
  end

  scenario "Invalid cost" do
    fill_in "Cost", :with => "abc"
    click_button "Create Booking"
    page.should have_content("Booking was not created.")
    page.should have_content("Cost is not a number")
  end
end