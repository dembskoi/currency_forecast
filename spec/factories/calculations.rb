FactoryGirl.define do
  factory :calculation do
    amount Faker::Number.between(1, 2_147_483_647)
    max_waiting_time Faker::Number.between(1, 250)

    after(:build) do |_, evaluator|
      evaluator.user ||= create(:user)
      evaluator.base_currency ||= create(:currency)
      evaluator.target_currency ||= create(:currency, code: 'USD')
    end
  end
end
