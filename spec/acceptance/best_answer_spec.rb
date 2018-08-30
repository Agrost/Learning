# frozen_string_literal: true

require_relative 'acceptance_helper'

feature 'Set Best Answer' do
  given(:user) { create(:user) }
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
end
