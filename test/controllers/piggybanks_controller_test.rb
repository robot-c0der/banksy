require "test_helper"

class PiggybanksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get piggybanks_new_url
    assert_response :success
  end

  test "should get edit" do
    get piggybanks_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get piggybanks_destroy_url
    assert_response :success
  end

  test "should get deposit" do
    get piggybanks_deposit_url
    assert_response :success
  end

  test "should get withdraw" do
    get piggybanks_withdraw_url
    assert_response :success
  end
end
