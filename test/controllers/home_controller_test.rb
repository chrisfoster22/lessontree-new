require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should see plan preview cards on home page" do
    get :index
    assert_response :success
    page.has_link?('sign_up_button') 
  end

end
