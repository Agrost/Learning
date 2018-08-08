# frozen_string_literal: true

FactoryBot.define do
  factory :question do |n|
    title 'MyString#{n}'
    body 'MyText#{n}'
  end

  factory :invalid_question, class: "Question" do
    title nil
    body nil
  end
end
