RSpec.describe Currency, type: :model do
  context 'attributes' do
    it { is_expected.to respond_to(:code) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end
end
