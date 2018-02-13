FactoryBot.define do
  factory :customer do
    first_name "John"
  end

  factory :customer2, class: Customer do
    first_name "Ivan"
  end
end
