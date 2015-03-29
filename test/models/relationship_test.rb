require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @relationship = Relationship.new(user_id: 1, challenge_id: 2)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require a user_id" do
    @relationship.user_id = nil
    assert_not @relationship.valid?
  end

  test "should require a challenge_id" do
    @relationship.challenge_id = nil
    assert_not @relationship.valid?
  end
end
