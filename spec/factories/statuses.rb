FactoryBot.define do
  factory :status do
    id 1
    name 'order received'
  end

  factory :waiting, class: Status do
    id 2
    name 'waiting for delivery'
  end
end
