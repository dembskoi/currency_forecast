RSpec.describe CurrencyRate, type: :model do
  context 'relations' do
    it { is_expected.to belong_to(:base_currency) }
  end

  context 'attributes' do
    it { is_expected.to respond_to(:base_currency) }
    it { is_expected.to respond_to(:base_currency_id) }
    it { is_expected.to respond_to(:year) }
    it { is_expected.to respond_to(:week) }
    it { is_expected.to respond_to(:rates) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_presence_of(:week) }
    it { is_expected.to validate_presence_of(:rates) }
    it do
      is_expected.to validate_numericality_of(:year).only_integer
        .is_greater_than_or_equal_to(2010).is_less_than_or_equal_to(2050)
    end
    it do
      is_expected.to validate_numericality_of(:week).only_integer
        .is_greater_than_or_equal_to(1).is_less_than_or_equal_to(53)
    end
  end
end
