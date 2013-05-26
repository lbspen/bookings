require 'spec_helper'

feature "Viewing engineers" do
  let!(:engineer) { Factory.create(:engineer, :name => "Joe") }

  scenario "Listing all engineers" do
    visit engineers_url
    click_link engineer.name
    page.current_url.should == engineer_url(engineer)
  end

  scenario "Viewing list of clients" do
    booking1 = Factory.create(:booking, :engineer => engineer)
    client = Factory.create(:client, :name => "Jay")
    booking2 = Factory.create(:booking, :engineer => engineer, :client => client)
    visit engineer_url(engineer)
    page.should have_content(engineer.name)
    page.should have_content(booking1.client.name)
    page.should have_content(booking2.client.name)
  end
end