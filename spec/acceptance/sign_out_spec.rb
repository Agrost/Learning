# frozen_string_literal: true

require_relative 'acceptance_helper'

describe 'User sign out' do
  let(:user) { create(:user) }

  it 'Logged user signs out' do
    sign_in(user)
    visit questions_path
    click_link 'Exit'
    expect(page).to have_content 'Signed out successfully.'
  end
end
