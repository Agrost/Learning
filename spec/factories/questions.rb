# frozen_string_literal: true

FactoryBot.define do
  sequence :title do |n|
    "title#{n}"
  end
  sequence :body do |n|
    "body#{n}"
  end
  factory :question do
    title
    body
    user
  end

  factory :invalid_question, class: 'Question' do
    title { nil }
    body { nil }
    user { nil }
  end
end
