# frozen_string_literal: true

require_relative 'acceptance_helper'

describe 'Delete Answer' do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:question) { create(:question, user: user) }
  let(:answer) { create(:answer, question: question, user: user) }

  it 'Logged user delete his answer' do
    sign_in(user)
    question
    answer
    visit root_path
    click_link 'Show'
    click_button 'Delete answer'
  end
  it 'Logged user tries to delete not his answer' do
    sign_in(user)
    question
    answer
    sign_out(user)
    sign_in(user2)
    visit root_path
    click_link 'Show'
    expect(page).not_to have_link 'Delete answer'
  end
  it 'Not logged user tries to delete answer' do
    visit answer_path(answer)
    expect(page).not_to have_link 'Delete'
  end
end
