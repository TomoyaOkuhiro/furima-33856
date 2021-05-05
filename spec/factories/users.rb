FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password  {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname {'SATO'}
    last_name {'佐藤'}
    first_name {'陽二'}
    last_name_kana {'サトウ'}
    first_name_kana {'ヨウジ'}
    birth_day {'2000-01-01'}
  end
end