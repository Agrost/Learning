require_relative 'acceptance_helper'

feature 'User answer' do
  given!(:user) { create(:user) }
  given!(:question) { create(:question) }
  given!(:answer) { create(:answer, question: question, user: user) }
  scenario 'Authenticated user create answer', js: true do
    sign_in(user)
    visit question_path(question)
    fill_in 'Body', with: 'MyText2'
    click_on "Create answer"
    within '.answers' do
    expect(page).to have_content 'MyText2'
    end
  end
  scenario 'Authenticated user create answer', js: true do
    visit question_path(question)

  end
end
