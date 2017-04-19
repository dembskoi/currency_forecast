FactoryGirl.define do
  factory :calculation do
    base_currency nil
    target_currency nil
    amount 1
    max_waiting_time 1
  end
end
