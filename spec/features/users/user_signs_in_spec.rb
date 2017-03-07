require "rails_helper"

RSpec.feature "A user signs in" do

  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
  end

  scenario "Successfully with nav bar links" do
    visit "/"

    click_link("nav-bar-login")

    fill_in "Email", with: @john.email

    fill_in "Password", with: @john.password

    click_button "Login"

    expect(page).to have_content("Logged in successfully.")
  end

  scenario "Erroneously with blank password nav bar links " do
    visit "/"

    click_link("nav-bar-login")

    fill_in "Email", with: @john.email

    fill_in "Password", with: ""

    click_button "Login"

    expect(page).to have_content("Invalid email or password")
  end

  scenario "Erroneously with blank email nav bar links " do
    visit "/"

    click_link("nav-bar-login")

    fill_in "Email", with: ""

    fill_in "Password", with: @john.password

    click_button "Login"

    expect(page).to have_content("Invalid email or password")
  end

  scenario "Erroneously with wrong password nav bar links " do
    visit "/"

    click_link("nav-bar-login")

    fill_in "Email", with: @john.email

    fill_in "Password", with: "pissweird"

    click_button "Login"

    expect(page).to have_content("Invalid email or password")
  end

  scenario "Erroneously with no account nav bar links " do
    visit "/"

    click_link("nav-bar-login")

    fill_in "Email", with: "notjohn@example.com"

    fill_in "Password", with: "password"

    click_button "Login"

    expect(page).to have_content("Invalid email or password")
  end

  scenario "Successfully with nav drawer links" do
    visit "/"

    click_link("nav-drawer-login")

    fill_in "Email", with: @john.email

    fill_in "Password", with: @john.password

    click_button "Login"

    expect(page).to have_content("Logged in successfully.")
  end

  scenario "Erroneously with blank password nav drawer links " do
    visit "/"

    click_link("nav-drawer-login")

    fill_in "Email", with: @john.email

    fill_in "Password", with: ""

    click_button "Login"

    expect(page).to have_content("Invalid email or password")
  end

  scenario "Erroneously with blank email nav drawer links " do
    visit "/"

    click_link("nav-drawer-login")

    fill_in "Email", with: ""

    fill_in "Password", with: @john.password

    click_button "Login"

    expect(page).to have_content("Invalid email or password")
  end

  scenario "Erroneously with wrong password nav drawer links " do
    visit "/"

    click_link("nav-drawer-login")

    fill_in "Email", with: @john.email

    fill_in "Password", with: "pissweird"

    click_button "Login"

    expect(page).to have_content("Invalid email or password")
  end

  scenario "Erroneously with no account nav drawer links " do
    visit "/"

    click_link("nav-drawer-login")

    fill_in "Email", with: "notjohn@example.com"

    fill_in "Password", with: "password"

    click_button "Login"

    expect(page).to have_content("Invalid email or password")
  end



end
