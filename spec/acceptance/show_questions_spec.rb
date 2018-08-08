require 'rails_helper'

feature 'Create question', %q{
In order to get questions from community
And watch them
I want to be able to ask questions
} do
  given(:user) { create(:user) }
  given(:question) { create(:question) }

  scenario 'user views questions' do
   question
   question2 = create(:question)
   visit root_path
   expect(page).to have_content question.title
   expect(page).to have_content question2.title
 end

  scenario 'Authenticated user views questions' do
    sign_in(user)

    visit new_question_path
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'text text'

    click_on 'Create'
    save_and_open_page
    expect(page).to have_content question.title
    expect(page).to have_content question.body

    expect(page).to have_content("Your question successfully created.")
  end
end
