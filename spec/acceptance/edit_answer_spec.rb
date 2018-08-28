# frozen_string_literal: true

require_relative 'acceptance_helper'

describe 'Answer editing' do
  let(:user) { create(:user) }
  let!(:question) { create(:question) }
  let!(:answer) { create(:answer, question: question, user: user) }

  it 'Un-autenticated user try to edit answer' do
    sign_in(user)
    question
    visit question_path(question)
    expect(page).not_to have_link 'Edit question'
  end
  describe 'Autenticated user' do
    it 'sees link to edit answer' do
      sign_in(user)
      visit question_path(question)
      within '.answers' do
        expect(page).to have_link 'Edit'
      end
    end
    it 'try to edit his answer', js: true do
      sign_in(user)
      visit question_path(question)
      click_link 'Edit answer'
      within '.answers' do
        fill_in 'answer_body', with: 'edited answer'
        click_on 'Save'
        expect(page).not_to have_content answer.body
        expect(page).to have_content 'edited answer'
        expect(page).not_to have_selector 'textarea'
      end
    end
  end
end
