require "rails_helper"

RSpec.feature "A signed in user logs out" do

  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario "Successfully with nav bar link" do
    visit "/"

    click_link "nav-bar-logout"

    expect(page).to have_content("Logged out successfully.")
    expect(page).to have_link("nav-bar-register")
    expect(page).to have_link("nav-drawer-register")
    expect(page).to have_link("nav-bar-login")
    expect(page).to have_link("nav-drawer-login")
  end

  scenario "Successfully with nav drawer link" do
    visit "/"

    click_link "nav-drawer-logout"

    expect(page).to have_content("Logged out successfully.")
    expect(page).to have_link("nav-bar-register")
    expect(page).to have_link("nav-drawer-register")
    expect(page).to have_link("nav-bar-login")
    expect(page).to have_link("nav-drawer-login")
  end

end
