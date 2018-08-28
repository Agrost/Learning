# frozen_string_literal: true

require_relative 'acceptance_helper'

describe 'Set Best Answer' do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:question) { create(:question, user: user) }
  let!(:answer) { create(:answer, question: question, user: user) }

  it 'Logged user tries to set best answer' do
    visit question_path(question)
    expect(page).not_to have_content 'Best'
  end
  it 'Not logged user tries to set best answer' do
    visit question_path(question)
    expect(page).not_to have_content 'Best'
  end
  describe 'Author of question' do
    before do
      sign_in(user)
      visit question_path(question)
    end

    it 'tries to set best answer', js: true do
      click_button 'Best'
      expect(page).to have_content 'Best answer'
    end
  end
end
