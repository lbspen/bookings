require 'spec_helper'

feature "Viewing Bookings -" do
  let!(:booking) { Factory.create(:booking) }

  before do
    visit "/"
  end

  scenario "Viewing bookings list" do
    page.should have_content(booking.engineer.name)
    page.should have_content(booking.client.name)
    page.should have_content(booking.cost)
  end

  scenario "Can add engineer" do
    click_link "New Engineer"
    page.current_url == new_engineer_url
  end

  scenario "Can add client" do
    click_link "New Client"
    page.current_url == new_client_url
  end
end