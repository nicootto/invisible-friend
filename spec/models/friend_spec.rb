require 'rails_helper'

# Test suite for the Item model
RSpec.describe Friend, type: :model do
  subject { create(:friend) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:group) }
    it { is_expected.to belong_to(:friend).class_name('User') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
  end

  it 'is valid with valid attributes' do
    is_expected.to be_valid
  end

  it 'is invalid without a user' do
    subject.user = nil
    is_expected.to_not be_valid
  end

  it 'is invalid without a group' do
    subject.group = nil
    is_expected.to_not be_valid
  end

  it 'is invalid without a friend' do
    subject.friend = nil
    is_expected.to_not be_valid
  end

end