
class DrawsHelperTest < ActionView::TestCase
  test "should return a friend for every participant" do
    participants = ('a'..'c').to_a

    1000.times do
      friends = find_friend(participants)

      assert friends.size == participants.size
      friends.each do |f|
        assert f[0] != f[1]
      end
    end
  end

end