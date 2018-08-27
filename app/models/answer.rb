# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  has_many :attachments, as: :attachmentable
  belongs_to :user

  accepts_nested_attributes_for :attachments
  validates :body, :question_id, presence: true
  default_scope { order(best: :desc) }
  def set_best!
    transaction do
      question.answers.update_all(best: false)
      update!(best: true)
    end
  end
end
