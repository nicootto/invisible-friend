def find_friend(participants)
  friendship = []

  success = false
  until success do
    need_friend = participants.dup
    friendship = []

    participants.each do |p|
      # You can't be friend of yourself
      if need_friend.size == 1 && need_friend[0] == p
        break
      end

      friend = need_friend.sample
      while friend == p do
        friend = need_friend.sample
      end

      friendship << [p, friend]
      need_friend.delete(friend)
    end
    success = need_friend.empty?
  end

end