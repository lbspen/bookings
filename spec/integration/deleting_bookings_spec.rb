require 'spec_helper'

feature "Deleting a booking -" do
  let!(:booking) { Factory.create(:booking) }
  scenario "Delete a booking" do
    visit "/"
    page.should have_content(booking.engineer.name)
    click_link "Delete"
    page.should_not have_content(booking.engineer.name)
  end
end