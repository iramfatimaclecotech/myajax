require "test_helper"

class FormValidations::Posts2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get form_validations_posts2_index_url
    assert_response :success
  end
end
