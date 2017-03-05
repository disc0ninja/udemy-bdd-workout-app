require "rails_helper"

RSpec.feature "Creating Exercise" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario "with valid inputs" do
    visit "/"

    click_link "nav-bar-lounge"

    click_button "Add Exercise"

    fill_in "Duration", with: "30"
    fill_in "Working Details", with: "Ran on treadmill for 30 minutes"

    click_button "Submit"

    expect(page).to have_content("Exercise added successfully")
    expect(page).to have_content("Created by #{@john.email}")
    expect(current_path).to eq exercise_path(Exercise.last)

  end

end
