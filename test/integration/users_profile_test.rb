require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_match @user.challenges.count.to_s, response.body
    @user.challenges.each do |challenge|
      assert_match challenge.task, response.body
    end
  end
end
