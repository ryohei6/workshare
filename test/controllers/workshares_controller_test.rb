require 'test_helper'

class WorksharesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workshare = workshares(:one)
  end

  test "should get index" do
    get workshares_url
    assert_response :success
  end

  test "should get new" do
    get new_workshare_url
    assert_response :success
  end

  test "should create workshare" do
    assert_difference('Workshare.count') do
      post workshares_url, params: { workshare: { body: @workshare.body, title: @workshare.title } }
    end

    assert_redirected_to workshare_url(Workshare.last)
  end

  test "should show workshare" do
    get workshare_url(@workshare)
    assert_response :success
  end

  test "should get edit" do
    get edit_workshare_url(@workshare)
    assert_response :success
  end

  test "should update workshare" do
    patch workshare_url(@workshare), params: { workshare: { body: @workshare.body, title: @workshare.title } }
    assert_redirected_to workshare_url(@workshare)
  end

  test "should destroy workshare" do
    assert_difference('Workshare.count', -1) do
      delete workshare_url(@workshare)
    end

    assert_redirected_to workshares_url
  end
end
