require 'test_helper'

class ChallengesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @challenge = challenges(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Challenge.count' do
      post :create, challenge: { task: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Challenge.count' do
      delete :destroy, id: @challenge
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong challenge" do
    log_in_as(users(:michael))
    challenge = challenges(:ants)
    assert_no_difference 'Challenge.count' do
      delete :destroy, id: challenge
    end
    assert_redirected_to root_url
  end
end
