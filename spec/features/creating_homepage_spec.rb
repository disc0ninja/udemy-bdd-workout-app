require "rails_helper"

RSpec.feature "Home Page" do

  scenario "A user visits the home page" do
    visit "/"

    expect(page).to have_link "nav-bar-home"
    expect(page).to have_link "nav-drawer-home"

    expect(page).to have_link "nav-bar-register"
    expect(page).to have_link "nav-drawer-register"

    expect(page).to have_link "nav-bar-athletes-den"
    expect(page).to have_link "nav-drawer-athletes-den"

    expect(page).to have_content("Workout Lounge")

    expect(page).to have_content("Share your workout with friends and family")
  end

end
