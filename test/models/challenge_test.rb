require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @challenge = @user.challenges.build(title: "heloo",task: "Lorem ipsum")
  end


  test "should be valid" do
    assert @challenge.valid?
  end

  test "order should be most recent first" do
    assert_equal Challenge.first, challenges(:most_recent)
    # assert_equal Challenge.count, 1
  end
end
