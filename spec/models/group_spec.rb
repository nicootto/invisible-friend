require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { create(:group) }

  describe 'Associations' do
    it { is_expected.to have_many(:group_users) }
    it { is_expected.to have_many(:users).through(:group_users) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner) }
  end

  it 'is valid with valid attributes' do
    is_expected.to be_valid
  end

  it 'is not valid without a name' do
    subject.name = '   '
    is_expected.to_not be_valid
  end

  it 'is not valid without an owner' do
    subject.owner = nil
    is_expected.to_not be_valid
  end

  it 'is valid without a picture' do
    subject.picture = nil
    is_expected.to be_valid
  end
end
