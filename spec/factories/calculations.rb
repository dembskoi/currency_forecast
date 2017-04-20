FactoryGirl.define do
  factory :calculation do
    amount Faker::Number.between(1, 2147483647)
    max_waiting_time Faker::Number.between(1, 250)

    after(:build) do |_, evaluator|
      evaluator.base_currency ||= create(:currency)
      evaluator.target_currency ||= create(:currency, code: 'USD')
    end
  end
end
