require "rails_helper"

RSpec.feature "Creating Exercise" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario "with valid inputs (nav-bar)" do
    visit "/"

    click_link "nav-bar-lounge"

    click_link "New Exercise"

    fill_in "Duration", with: 30
    fill_in "Workout", with: "Ran on treadmill for 30 minutes"
    fill_in "Workout date", with: 3.days.ago

    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created successfully")
    expect(page).to have_content("Created by #{@john.email}")
    @exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@john, @exercise))
    expect(@exercise.user_id).to eq(@john.id)

  end

  scenario "with invalid inputs (nav-bar)" do
    visit "/"

    click_link "nav-bar-lounge"

    click_link "New Exercise"

    fill_in "Duration", with: 0
    fill_in "Workout", with: ""
    fill_in "Workout date", with: ""

    click_button "Create Exercise"

    expect(page).to have_content("Exercise could not be saved")
  end

  scenario "with valid inputs (nav-drawer)" do
    visit "/"

    click_link "nav-drawer-lounge"

    click_link "New Exercise"

    fill_in "Duration", with: 30
    fill_in "Workout", with: "Ran on treadmill for 30 minutes"
    fill_in "Workout date", with: "2017-05-04"

    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created successfully")
    expect(page).to have_content("Created by #{@john.email}")
    @exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@john, @exercise))
    expect(@exercise.user_id).to eq(@john.id)

  end

  scenario "with invalid inputs (nav-drawer)" do
    visit "/"

    click_link "nav-drawer-lounge"

    click_link "New Exercise"

    fill_in "Duration", with: 0
    fill_in "Workout", with: ""
    fill_in "Workout date", with: ""

    click_button "Create Exercise"

    expect(page).to have_content("Exercise could not be saved")
  end

end
