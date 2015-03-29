require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "should play and quit a challenge" do
    michael = users(:michael)
    orange = challenges(:orange)
    assert_not michael.playing?(orange)
    michael.join(orange)
    assert michael.playing?(orange)
    michael.quit(orange)
    assert_not michael.playing?(orange)
  end
end
