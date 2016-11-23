require 'rspec/rails'

require 'capybara/rspec'
require 'capybara/rails'

Rspec.features "view login page" do
  scenario "user view form" do
    # setting some things
    user_email = "admin@gmaiil.com"
    user_password = "123456"

    # do some action here
    visit root_path
    fill_in "user_email", with: user_email
    fill_in "user_password", with: user_password
    click_on "Log in"

    # check values
    expect(page).to have_link? "Article", href: "/articles1"



  end
end
