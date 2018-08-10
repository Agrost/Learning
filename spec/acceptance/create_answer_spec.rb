require 'rails_helper'

feature 'Create answer', %q{
  To answer the question
  As an authenticated user
  I want to be able to answer questions
  } do
  given(:user) { create(:user) }
  given(:question) { create(:question) }

  scenario 'user views questions' do
    sign_in(user)
    question
    visit root_path
    click_on "title1"

    click_link 'Add answer'
  save_and_open_page
    fill_in 'Body', with: 'text text'

  end
end
