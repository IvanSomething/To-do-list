# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    first_name { 'first_name' }
    last_name { 'last_name' }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
