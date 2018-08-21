# frozen_string_literal: true

require_relative 'acceptance_helper'

feature 'User answer' do
  given!(:user) { create(:user) }
  given!(:question) { create(:question) }
  scenario 'Authenticated user create answer', js: true do
    sign_in(user)
    visit question_path(question)
    fill_in 'answer_body', with: 'MyText'
    click_on 'Create answer'
    within '.answers' do
      expect(page).to have_content 'MyText'
    end
  end
  scenario 'Authenticated user create invalid answer', js: true do
    sign_in(user)
    visit question_path(question)
    click_on 'Create answer'
    expect(page).to have_content "Body can't be blank"
  end
end
