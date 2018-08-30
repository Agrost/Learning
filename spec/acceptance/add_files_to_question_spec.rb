# frozen_string_literal: true

require_relative 'acceptance_helper'
feature 'Add files to question', "
 In order to illustrate my question
 As an question's autor
 I'd like to be able to attach files
" do
  given(:user) { create(:user) }
  background do
    sign_in(user)
    visit new_question_path
  end
  scenario 'User adds file when asks question' do
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'text text text'
    attach_file 'File', '12345'
    click_on 'Create'
    expect(page).to have_content '12345'
  end
end
