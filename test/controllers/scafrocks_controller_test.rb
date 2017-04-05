require 'test_helper'

class ScafrocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scafrock = scafrocks(:one)
  end

  test "should get index" do
    get scafrocks_url
    assert_response :success
  end

  test "should get new" do
    get new_scafrock_url
    assert_response :success
  end

  test "should create scafrock" do
    assert_difference('Scafrock.count') do
      post scafrocks_url, params: { scafrock: { hand_a: @scafrock.hand_a, hand_b: @scafrock.hand_b, name_a: @scafrock.name_a, name_b: @scafrock.name_b } }
    end

    assert_redirected_to scafrock_url(Scafrock.last)
  end

  test "should show scafrock" do
    get scafrock_url(@scafrock)
    assert_response :success
  end

  test "should get edit" do
    get edit_scafrock_url(@scafrock)
    assert_response :success
  end

  test "should update scafrock" do
    patch scafrock_url(@scafrock), params: { scafrock: { hand_a: @scafrock.hand_a, hand_b: @scafrock.hand_b, name_a: @scafrock.name_a, name_b: @scafrock.name_b } }
    assert_redirected_to scafrock_url(@scafrock)
  end

  test "should destroy scafrock" do
    assert_difference('Scafrock.count', -1) do
      delete scafrock_url(@scafrock)
    end

    assert_redirected_to scafrocks_url
  end
end
