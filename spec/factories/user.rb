FactoryBot.define do
  factory :user do
    email { 'bob@example.com' }
    password { '123456' }
    #password_confirmation { '123456' }
    first_name { 'Bob' }
    last_name { 'Boberson' }
    #confirmed_at Date.today
  end
end
