require_relative 'acceptance_helper'

feature 'Delete Answer' do
  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given(:question) { create(:question, user: user) }
  given(:answer) { create(:answer, question: question, user: user) }
  scenario 'Logged user delete his answer' do
    sign_in(user)
    question
    answer
    visit root_path
    click_link 'Show'
    click_button 'Delete answer'
  end
  scenario 'Logged user tries to delete not his answer' do
    sign_in(user)
    question
    answer
    sign_out(user)
    sign_in(user2)
    visit root_path
    click_link 'Show'
    expect(page).to_not have_link 'Delete answer'
  end
  scenario 'Not logged user tries to delete answer' do
    visit answer_path(answer)
     expect(page).to_not have_link 'Delete'
  end
end
