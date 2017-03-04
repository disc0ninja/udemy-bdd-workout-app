require "rails_helper"

RSpec.feature "A user registers for a new account" do

  scenario "A user successfully signs registers for a new account" do
    visit "/"

    click_link("nav-bar-register")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Register"

    expect(page).to have_content "You have registered successfully"
  end

  scenario "A user fails to register with: an empty email" do
    visit "/"

    click_link("nav-bar-register")

    fill_in "Email", with: ""
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Register"

    expect(page).to have_content "Email can't be blank"
  end

  scenario "A user fails to register with: an empty password" do
    visit "/"

    click_link("nav-bar-register")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""

    click_button "Register"

    expect(page).to have_content "Password can't be blank"
  end

  scenario "A user fails to register with: an empty email and password" do
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
    @john = User.create(email: "john@example.com", password: "password")
  end

  scenario "A user fails to register with: mismatched passwords" do
    visit "/"

    click_link("nav-bar-register")

    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    fill_in "Password confirmation", with: @john.password

    click_button "Register"

    expect(page).to have_content "Email already in use"
  end

end
