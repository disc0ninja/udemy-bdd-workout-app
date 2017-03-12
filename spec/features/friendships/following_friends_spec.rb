require "rails_helper"

RSpec.feature "Following Friends:" do

  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")

    @peter = User.create(first_name: "Peter", last_name: "Parker", email: "spidey@example.com", password: "password")

    login_as(@john)
  end

  scenario "if signed in" do
    visit "/"


    expect(page).not_to have_link("#{@john}-follow")

    link = "a[href='/friendships?friend_id=#{@peter.id}']"
    find(link).click


    expect(page).not_to have_link("#{@peter}-follow")
  end

end
