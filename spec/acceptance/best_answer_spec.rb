require_relative 'acceptance_helper'

feature 'Set Best Answer' do
  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:answer) { create(:answer, question: question, user: user) }
  scenario 'Logged user tries to set best answer' do
    visit question_path(question)
    expect(page).to_not have_content 'Best'
  end
  scenario 'Not logged user tries to set best answer' do
    visit question_path(question)
    expect(page).to_not have_content 'Best'
  end
  describe 'Author of question' do
    before do
      sign_in(user)
      visit question_path(question)
    end
    scenario 'tries to set best answer', js: true do
      click_button 'Best'
      expect(page).to have_content 'Best answer'
    end
  end
end
