require "rails_helper"

RSpec.feature "Showing friend workout" do

  before  do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")

    @peter = User.create(first_name: "Peter", last_name: "Parker", email: "spidey@example.com", password: "password")

    @exercise_1 = @john.exercises.create(duration_in_min: 74, workout: "Leg Extensions",
      workout_date: Date.today)

    @exercise_2 = @peter.exercises.create(duration_in_min: 32, workout: "Pull ups",
      workout_date: Date.today)

    login_as(@john)

    @following = Friendship.create(user: @john, friend: @peter)
  end

  scenario "shows friends workout for last 7 days" do
    visit "/"

    click_link "nav-bar-lounge"
    click_link @peter.full_name

    expect(page).to have_content("#{@peter.full_name}'s Exercises")
    expect(page).to have_content(@exercise_2.workout)
  end

end
