# frozen_string_literal: true

RSpec.describe Question, type: :model do
  it { should have_many(:answers).dependent(:destroy) }
  it { should belong_to :user }
  it { should have_many(:attachments) }
  it { should validate_presence_of :title }
  it { should validate_presence_of(:body) }
  it { should validate_uniqueness_of(:title) }
  it {should accept_nested_attributes_for :attachments}
end
