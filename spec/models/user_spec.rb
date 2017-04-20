RSpec.describe User, type: :model do
  context 'relations' do
    it { is_expected.to have_many(:calculations) }
  end

  context 'attributes' do
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:username) }
    it { is_expected.to respond_to(:login) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity }
  end
end
