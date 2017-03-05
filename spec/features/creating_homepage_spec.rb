require "rails_helper"

RSpec.feature "Home Page" do

  before do
    @john = User.create(email: "john@example.com", password: "password")
  end

  scenario "A non logged in user visits the home page" do
    visit "/"

    expect(page).to have_link "nav-bar-home"
    expect(page).to have_link "nav-drawer-home"

    expect(page).not_to have_link "nav-bar-logout"
    expect(page).not_to have_link "nav-drawer-logout"

    expect(page).to have_link "nav-bar-register"
    expect(page).to have_link "nav-drawer-register"

    expect(page).to have_link "nav-bar-login"
    expect(page).to have_link "nav-drawer-login"

    expect(page).to have_link "nav-bar-athletes-den"
    expect(page).to have_link "nav-drawer-athletes-den"

    expect(page).to have_content("Workout Lounge")

    expect(page).to have_content("Share your workout with friends and family")
  end

  scenario "A logged in user visits the home page" do
    login_as(@john)
    
    visit "/"

    expect(page).to have_link "nav-bar-home"
    expect(page).to have_link "nav-drawer-home"

    expect(page).to have_link "nav-bar-logout"
    expect(page).to have_link "nav-drawer-logout"

    expect(page).not_to have_link "nav-bar-register"
    expect(page).not_to have_link "nav-drawer-register"

    expect(page).not_to have_link "nav-bar-login"
    expect(page).not_to have_link "nav-drawer-login"

    expect(page).to have_link "nav-bar-athletes-den"
    expect(page).to have_link "nav-drawer-athletes-den"

    expect(page).to have_content("Workout Lounge")

    expect(page).to have_content("Share your workout with friends and family")
  end

end
