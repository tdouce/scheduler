require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

end
