require 'faker'

FactoryBot.define do
  factory :user do
    name { 'John' }
    email { 'john.fake@test.com' }
    password { "test" }
    password_confirmation { "test" }
  end
end