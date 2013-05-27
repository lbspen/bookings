require 'spec_helper'

feature "Editing Bookings " do
  let!(:booking) { Factory.create(:booking) }

  scenario "Edit a booking" do
    new_engineer = Factory.create(:engineer, :name => "Harry")  
    new_client = Factory.create(:client, :name => "Martha")
    visit "/"
    click_link("Edit")
    page.should have_content(booking.engineer.name)
    page.should have_content(booking.client.name)
    page.should have_field(:cost, :with => sprintf("%.2f", booking.cost))
    select(new_engineer.name, :from => "Engineer")
    select(new_client.name, :from => "Client")
    fill_in :cost, :with => 200
    click_button("Update Booking")
    page.should have_content("Booking was successfully updated.")
    page.should have_content(new_engineer.name)
    page.should have_content(new_client.name)
    page.should have_content(200)
  end

  scenario "Invalid cost" do
    pending "Should not allow invalid cost"
  end
end