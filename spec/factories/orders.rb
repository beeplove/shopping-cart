FactoryBot.define do
  factory :order do
    customer
    status
  end

  factory :order2, class: Order do
    association :customer, factory: :customer2, strategy: :create
    association :status, factory: :waiting, strategy: :create
  end
end
