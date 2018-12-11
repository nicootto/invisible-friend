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

  it "doesn't allows to insert users with same email" do
    another_user = User.new(name: 'Another name', email: subject.email)
    expect(another_user).to_not be_valid
  end

  it 'allows to insert multiple users without email' do
    user_count = User.count

    user_one = User.new(name: 'Pedro')
    expect(user_one).to be_valid
    user_one.save

    user_two = User.new(name: 'Juan')
    expect(user_two).to be_valid
    user_two.save

    expect(user_count + 2).to eq(User.count)
  end
end