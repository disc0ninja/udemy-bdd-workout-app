require "rails_helper"

RSpec.feature "Unfollow Friend" do

  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")

    @peter = User.create(first_name: "Peter", last_name: "Parker", email: "spidey@example.com", password: "password")

    login_as(@john)

    @following = Friendship.create(user: @john, friend: @peter)
  end

  scenario "Successfully" do
    visit "/"

    click_link "nav-bar-lounge"
    click_link "unfollow-#{@peter.first_name}-#{@peter.last_name}"

    expect(page).to have_content(/#{@peter.full_name} unfollowed/i)
  end

end
