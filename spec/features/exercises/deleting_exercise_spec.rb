require "rails_helper"

RSpec.feature "Delete an exercise" do
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")

    @exercise = @john.exercises.create!(duration_in_min: 48, workout: "Sit Ups", workout_date: Date.today)

    login_as(@john)
  end

  scenario "nav-bar-nav" do
    visit "/"

    click_link "nav-bar-lounge"

    click_link "#{@exercise.id}-delete"

    expect(page).to have_content("Exercise has been deleted")

  end

  scenario "nav-drawer-nav" do
    visit "/"

    click_link "nav-drawer-lounge"

    click_link "#{@exercise.id}-delete"

    expect(page).to have_content("Exercise has been deleted")

  end

end
