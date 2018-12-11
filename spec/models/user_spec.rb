require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:group_users) }
    it { is_expected.to have_many(:groups).through(:group_users) }
    it { is_expected.to have_many(:friends) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it 'is valid with valid attributes' do
      is_expected.to be_valid
    end

    it 'is not valid without a name' do
      subject.name = '  '
      is_expected.to_not be_valid
    end
  end
end