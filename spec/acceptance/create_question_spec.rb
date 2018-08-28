# frozen_string_literal: true

require_relative 'acceptance_helper'

describe 'Create question', '
  In order to get answer from community
  As an authentificated user
  I want to be able to ask questions
  ' do

  let(:user) { create(:user) }
  let(:question) { create(:question) }

  it 'Authenticated user creates question' do
    sign_in(user)
    question
    visit root_path
    expect(page).to have_content question.title
    expect(page).to have_content question.body
  end

  it 'Non-authenticated user ties to creates qustion' do
    visit new_question_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
