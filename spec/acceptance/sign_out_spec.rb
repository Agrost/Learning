require 'rails_helper'

feature 'User sign out' do
  given(:user) { create(:user) }

  scenario 'Logged user signs out' do
    sign_in(user)
    visit questions_path
    click_link 'Exit'
    save_and_open_page
    expect(page).to have_content 'Signed out successfully.'
  end
end