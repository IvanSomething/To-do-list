FactoryBot.define do
    factory :user do
      first_name { 'first_name' }
      last_name { 'last_name' }
      email { 'testemail@gmail.com' }
      password { 'password' } 
    end
end