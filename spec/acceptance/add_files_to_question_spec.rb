# frozen_string_literal: true

require_relative 'acceptance_helper'

describe 'Add files to question', "
  In order to illustrate my question
  As an question's autor
  I'd like to be able to attach files
" do

  let(:user) { create(:user) }

  before do
    sign_in(user)
    visit new_question_path
  end

  it 'User adds file when asks question' do
    fill_in 'Title', with: 'Test question'
    fill_in 'Text', with: 'text text text'
    attach_file 'File', '#{Rails.root}/spec/spec_helper.rb'
    click_on 'Create'

    expect(page).to have_content 'spec_helper'
  end
end
