# frozen_string_literal: true

RSpec.describe Question, type: :model do
  it { is_expected.to have_many(:answers).dependent(:destroy) }
  it { should have_many :attachments }
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to accept_nested_attributes_for :attachments }
end
