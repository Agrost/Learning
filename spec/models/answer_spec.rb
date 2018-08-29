# frozen_string_literal: true

RSpec.describe Answer, type: :model do
  it { should belong_to :question }
  it { should belong_to :user }
  it {should have_many :attachments }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:question_id) }
  it {accept_nested_attributes_for :attachments }
end
