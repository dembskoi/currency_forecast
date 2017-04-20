RSpec.describe Calculation, type: :model do
  context 'relations' do
    it { is_expected.to belong_to(:base_currency) }
    it { is_expected.to belong_to(:target_currency) }
  end

  context 'attributes' do
    it { is_expected.to respond_to(:base_currency) }
    it { is_expected.to respond_to(:base_currency_id) }
    it { is_expected.to respond_to(:target_currency) }
    it { is_expected.to respond_to(:target_currency_id) }
    it { is_expected.to respond_to(:amount) }
    it { is_expected.to respond_to(:max_waiting_time) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:max_waiting_time) }
    it do
      is_expected.to validate_numericality_of(:amount).only_integer.
        is_greater_than(0).is_less_than_or_equal_to(2147483647)
    end
    it do
      is_expected.to validate_numericality_of(:max_waiting_time).only_integer.
        is_greater_than_or_equal_to(1).is_less_than_or_equal_to(250)
    end
    it 'raises an error if base_currency and target_currency are equals' do
      calculation = create(:calculation)
      calculation.base_currency_id = calculation.target_currency_id
      expect{ calculation.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
