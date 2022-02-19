require "test_helper"

class Public::AdressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_adresses_index_url
    assert_response :success
  end

  test "should get deit" do
    get public_adresses_deit_url
    assert_response :success
  end
end
