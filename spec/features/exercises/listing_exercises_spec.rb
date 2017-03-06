require "rails_helper"

RSpec.feature "Listing Exercises" do

  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)

    @exercise_1 = @john.exercises.create(duration_in_min: 30, workout: "Pushups", workout_date: Date.today)

    @exercise_2 = @john.exercises.create(duration_in_min: 60, workout: "Weight lifting", workout_date: 2.days.ago)

    @exercise_3 = @john.exercises.create(duration_in_min: 40, workout: "Leg Press", workout_date: 8.days.ago)
  end

  scenario "show's user's workout for last 7 days (nav-bar)" do
    visit "/"

    click_link "nav-bar-lounge"

    expect(page).to have_content(@exercise_1.duration_in_min)
    expect(page).to have_content(@exercise_1.workout)
    expect(page).to have_content(@exercise_1.workout_date)

    expect(page).to have_content(@exercise_2.duration_in_min)
    expect(page).to have_content(@exercise_2.workout)
    expect(page).to have_content(@exercise_2.workout_date)

    expect(page).not_to have_content(@exercise_3.duration_in_min)
    expect(page).not_to have_content(@exercise_3.workout)
    expect(page).not_to have_content(@exercise_3.workout_date)
  end

  scenario "shows no exercies if none exist (nav-bar)" do
    @john.exercises.delete_all

    visit "/"

    click_link "nav-bar-lounge"

    expect(page).to have_content("No Exercises Created Yet")
    expect(page).to have_link("Create New Exercise")

    expect(page).not_to have_content(@exercise_1.duration_in_min)
    expect(page).not_to have_content(@exercise_1.workout)
    expect(page).not_to have_content(@exercise_1.workout_date)

    expect(page).not_to have_content(@exercise_2.duration_in_min)
    expect(page).not_to have_content(@exercise_2.workout)
    expect(page).not_to have_content(@exercise_2.workout_date)
  end

  scenario "show's user's workout for last 7 days (nav-drawer)" do
    visit "/"

    click_link "nav-drawer-lounge"

    expect(page).to have_content(@exercise_1.duration_in_min)
    expect(page).to have_content(@exercise_1.workout)
    expect(page).to have_content(@exercise_1.workout_date)

    expect(page).to have_content(@exercise_2.duration_in_min)
    expect(page).to have_content(@exercise_2.workout)
    expect(page).to have_content(@exercise_2.workout_date)

    expect(page).not_to have_content(@exercise_3.duration_in_min)
    expect(page).not_to have_content(@exercise_3.workout)
    expect(page).not_to have_content(@exercise_3.workout_date)
  end

  scenario "shows no exercies if none exist (nav-drawer)" do
    @john.exercises.delete_all

    visit "/"

    click_link "nav-drawer-lounge"

    expect(page).to have_content("No Exercises Created Yet")
    expect(page).to have_link("Create New Exercise")

    expect(page).not_to have_content(@exercise_1.duration_in_min)
    expect(page).not_to have_content(@exercise_1.workout)
    expect(page).not_to have_content(@exercise_1.workout_date)

    expect(page).not_to have_content(@exercise_2.duration_in_min)
    expect(page).not_to have_content(@exercise_2.workout)
    expect(page).not_to have_content(@exercise_2.workout_date)
  end

end
