RSpec.describe Currency, type: :model do
  context 'attributes' do
    it { is_expected.to respond_to(:code) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end

  describe '.after_commit' do
    it 'clears cache' do
      expect(Rails.cache).to receive(:delete)
      create(:currency)
    end
  end

  describe '.codes_by_id' do
    it 'returns nil when cache is empty' do
      expect(Rails.cache.fetch('currency_codes_by_id')).to be_nil
    end

    it 'creates cache' do
      Currency.codes_by_id
      expect(Rails.cache.fetch('currency_codes_by_id')).to_not be_nil
    end
  end
end
