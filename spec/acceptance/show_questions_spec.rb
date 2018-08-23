# frozen_string_literal: true

require_relative 'acceptance_helper'

describe 'Create question', '
In order to get questions from community
And watch them
I want to be able to ask questions
' do
  let(:user) { create :user }
  let(:question) { create(:question) }

  it 'user views questions' do
    sign_in(user)
    question
    question2 = create(:question)
    visit root_path
    expect(page).to have_content question.title
    expect(page).to have_content question.body
    expect(page).to have_content question2.title
    expect(page).to have_content question2.body
  end
end
