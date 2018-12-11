require 'rails_helper'
require 'set'

RSpec.describe DrawsHelper, type: :helper do
  describe '#find_friends' do
    let(:group) { create :group}
    let(:users) { create_list :user, 20 }

    before(:each) do
      users.each { |user| user.groups << group }
      group.reload
      find_friends(group)
    end

    it "match every group's user with a pair" do
      friends = Friend.where(group: group)
      expect(friends.size).to eq(group.users.size)

      users_ids = Set.new
      group.users.each { |user| users_ids << user.id}

      friends_ids = Set.new
      friends.each { |friend| friends_ids << friend.user_id }

      expect(users_ids).to eq(friends_ids)
    end

    it 'assigns each user just once' do
      friends = Friend.where(group: group)
      users_assigned = Set.new
      friends_assigned = Set.new

      friends.each do |friend|
        user_included = users_assigned.include?(friend.user)
        expect(user_included).to eq(false)

        friend_included = friends_assigned.include?(friend.friend)
        expect(friend_included).to eq(false)

        users_assigned << friend.user
        friends_assigned << friend.friend
      end
    end

    it 'assigns each user a friend distinct from himself' do
      friends = Friend.where(group: group)
      friends.each do |f|
        expect(f.user).to_not eq(f.friend)
      end
    end
  end
end
#
#
# class DrawsHelperTest < ActionView::TestCase
#   test "should return a friend for every participant" do
#     participants = ('a'..'c').to_a
#
#     1000.times do
#       friends = find_friend(participants)
#
#       assert friends.size == participants.size
#       friends.each do |f|
#         assert f[0] != f[1]
#       end
#     end
#   end
#
# end