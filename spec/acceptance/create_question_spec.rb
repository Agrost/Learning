require 'rails_helper'

feature 'Create question', %q{
  In order to get answer from community
  As an authentificated user
  I want to be able to ask questions
  } do

  given(:user) { create(:user) }

  scenario 'Authenticated user creates question' do
    sign_in(user)
    visit new_question_path
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'text text'
# save_and_open_page
    click_on 'Create'
    expect(page).to have_content("Your question successfully created.")
  end

  scenario 'Non-authenticated user ties to creates qustion' do
    visit new_question_path
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
