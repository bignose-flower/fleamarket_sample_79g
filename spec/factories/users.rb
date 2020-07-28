FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    password = Faker::Internet.password(min_length: 7)
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
    first_name {"名前"}
    family_name {"苗字"}
    hurigana_first {"なまえ"}
    hurigana_family {"みょうじ"}
    birthday {Faker::Date.birthday}
  end
end