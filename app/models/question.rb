# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user

  validates :title, :body, presence: true, uniqueness: true
  def to_s
    self[:title]
  end
end
