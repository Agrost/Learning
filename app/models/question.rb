class Question < ApplicationRecord
has_many :answers, dependent: :destroy
has_many :attachments
belongs_to :user
validates :title, :body, presence: true, uniqueness: true
  validates :user_id, presence: true
  def to_s
    self[:title]
  end
  accepts_nested_attributes_for :attachments
end
