require "rails_helper"

RSpec.feature "Serach for user:" do

  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")

    @sarah = User.create(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password")

    @joe = User.create(first_name: "Joe", last_name: "Dirt", email: "joe@dirt.com", password: "password")
  end

  scenario "with existing name, returns all users with searched name" do
    visit "/"

    fill_in "search-name", with: "Doe"

    click_button("search")

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(page).not_to have_content(@joe.full_name)
    expect(current_path).to eq("/dashboards/search")
  end

end
