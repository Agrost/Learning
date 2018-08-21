# frozen_string_literal: true

FactoryBot.define do
  sequence :answer_body do |n|
    "Answer body #{n}"
  end
  factory :answer do
    body
    question
    user
    best 'false'
  end
  factory :invalid_answer, class: 'Answer' do
    body nil
    question nil
    user nil
    best nil
  end
end
