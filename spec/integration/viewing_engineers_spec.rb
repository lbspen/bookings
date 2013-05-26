require 'spec_helper'

feature "Viewing engineers" do
  let!(:engineer) { Factory.create(:engineer, :name => "Joe") }

  scenario "Listing all engineers" do
    visit engineers_url
    click_link engineer.name
    page.current_url.should == engineer_url(engineer)
  end

  scenario "Viewing one engineer" do
    visit engineer_url(engineer)
    page.should have_content(engineer.name)
  end

  scenario "Viewing list of clients" do
    pending "View unordered list of clients"
  end
end