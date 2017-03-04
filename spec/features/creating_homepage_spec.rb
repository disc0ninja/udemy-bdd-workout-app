require "rails_helper"

RSpec.feature "Home Page" do

  scenario "A user visits the home page" do
    visit "/"

    # check for link called Home
    expect(page).to have_link "nav-bar-home"
    expect(page).to have_link "nav-drawer-home"
    # check for link called athletes den
    expect(page).to have_link "nav-bar-athletes-den"
    expect(page).to have_link "nav-drawer-athletes-den"
    # check for content 'Workout Lounge'
    expect(page).to have_content("Workout Lounge")
    # check for content 'Share your workout with friends and family'
    expect(page).to have_content("Share your workout with friends and family")
  end

end