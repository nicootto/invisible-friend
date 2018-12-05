module DrawsHelper

  def find_friends(group)
    # Delete previous friendships of this group
    Friend.where(group_id: group.id).delete_all

    friends = random_match(group.users)
    friends.each do |user, friend|
      Friend.create!(group_id: group.id,
                     user_id: user.id,
                     friend: friend.id)
    end
  end

  # Create a pair for every item without repeating elements
  # Do not pair an item with itself
  def random_match(items)
    raise 'Items size must be at least 2' if items.size == 1

    matches = []
    need_matching = items.dup

    items.each do |item|
      match = nil

      # If the only one who need a match is yourself,
      # interchange match with someone random
      if need_matching.size == 1 && need_matching[0] == item
        pair = matches.sample
        match = pair[1]
        pair[1] = item
      else
        loop do
          match = need_matching.sample
          break if match != item
        end
      end

      need_matching.delete(match)
      matches << [item, match]
    end
    return matches
  end
end
