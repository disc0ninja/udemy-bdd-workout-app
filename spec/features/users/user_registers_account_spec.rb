require "rails_helper"

RSpec.feature "A user registers for a new account" do

  scenario "A user successfully signs registers for a new account with nav bar links" do
    visit "/"

    click_link("nav-bar-register")

    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Register"

    expect(page).to have_content("Welcome! you have registered successfully.")
  end

  scenario "A user fails to register with: an empty email with nav bar links" do
    visit "/"

    click_link("nav-bar-register")

    fill_in "Email", with: ""
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Register"

    expect(page).to have_content "Email can't be blank"
  end

  scenario "A user fails to register with: an empty password with nav bar links" do
    visit "/"

    click_link("nav-bar-register")

    fill_in "Email", with: "user@example.com"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""

    click_button "Register"

    expect(page).to have_content "Password can't be blank"
  end

  scenario "A user fails to register with: an empty email and password with nav bar links" do
    visit "/"

    click_link("nav-bar-register")

    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""

    click_button "Register"

    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Email can't be blank"
  end

  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
  end

  scenario "A user fails to register with email already in use" do
    visit "/"

    click_link("nav-bar-register")

    fill_in "Email", with: @john.email
    fill_in "First name", with: @john.first_name
    fill_in "Last name", with: @john.last_name
    fill_in "Password", with: @john.password
    fill_in "Password confirmation", with: @john.password

    click_button "Register"

    expect(page).to have_content "Email has already been taken"
  end

  scenario "A user successfully signs registers for a new account with nav drawer links" do
    visit "/"

    click_link("nav-drawer-register")

    fill_in "Email", with: "user@example.com"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Register"

    expect(page).to have_content("Welcome! you have registered successfully.")
  end

end
