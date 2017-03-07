require "rails_helper"

RSpec.feature "Editing exercise" do

  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")

    @exercise = @john.exercises.create!(duration_in_min: 48, workout: "Sit Ups", workout_date: Date.today)

    login_as(@john)
  end

  scenario "with valid data succeeds (nav-bar)" do
    visit "/"

    click_link "nav-bar-lounge"

    path = "/users/#{@john.id}/exercises/#{@exercise.id}/edit"
    link = "a[href=\'#{path}\']"

    find(link).click

    fill_in "Duration", with: 45
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(48)
  end

  scenario "with invalid data succeeds (nav-bar)" do
    visit "/"

    click_link "nav-bar-lounge"

    path = "/users/#{@john.id}/exercises/#{@exercise.id}/edit"
    link = "a[href=\'#{path}\']"

    find(link).click

    fill_in "Duration", with: ""
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has not been updated")
    expect(page).not_to have_content(45)
    expect(page).not_to have_content(48)
  end

  scenario "with valid data succeeds (nav-drawer)" do
    visit "/"

    click_link "nav-drawer-lounge"

    path = "/users/#{@john.id}/exercises/#{@exercise.id}/edit"
    link = "a[href=\'#{path}\']"

    find(link).click

    fill_in "Duration", with: 45
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(48)
  end

  scenario "with invalid data succeeds (nav-drawer)" do
    visit "/"

    click_link "nav-drawer-lounge"

    path = "/users/#{@john.id}/exercises/#{@exercise.id}/edit"
    link = "a[href=\'#{path}\']"

    find(link).click

    fill_in "Duration", with: ""
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has not been updated")
    expect(page).not_to have_content(45)
    expect(page).not_to have_content(48)
  end

end
