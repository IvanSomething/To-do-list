# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    user
    title { 'title' }
    description { 'description' }
    status { 'recently_added' }

    trait :in_progress do
      status { 'in_progress' }
    end

    trait :done do
      status { 'done' }
    end
  end
end
