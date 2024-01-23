FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    last_name_kana        { Faker::Base.regexify(/[ア-ン゛゜ァ-ォャ-ョーa-zA-Z0-9]{1,20}/) }
    first_name_kana       { Faker::Base.regexify(/[ア-ン゛゜ァ-ォャ-ョーa-zA-Z0-9]{1,20}/) }
    birth_date            { '2000-01-01' }
  end
end
