FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" } # name "Michael Hartl"
    sequence(:email) { |n| "person_#{n}@example.com" } # email "michael@example.com"
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end