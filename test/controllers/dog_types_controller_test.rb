require 'test_helper'

class DogTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dog_types_index_url
    assert_response :success
  end

  test "should get edit" do
    get dog_types_edit_url
    assert_response :success
  end

end
