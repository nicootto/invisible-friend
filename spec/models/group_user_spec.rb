require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  subject { GroupUser.create!(group: create(:group), user: create(:user)) }

  describe 'associations' do
    it { is_expected.to belong_to(:group) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:group) }
    it { is_expected.to validate_presence_of(:user) }
  end

  it 'is valid with valid attributes' do
    is_expected.to be_valid
  end

  it 'is invalid without a group' do
    subject.group = nil
    is_expected.to_not be_valid
  end

  it 'is invalid without an user' do
    subject.user = nil
    is_expected.to_not be_valid
  end
end
