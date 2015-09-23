FactoryGirl.define do
  factory :snsstudy do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :tsubyaki do
    content "こんにちわ"
    snsstudy
  end


end