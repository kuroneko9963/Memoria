require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @basic_title = "Memoria"
  end

  test "should get top" do
    get root_path
    assert_response :success
    assert_select 'title', "#{@basic_title}"
    assert_select 'a[href=?]', root_path
    assert_select 'h1', 'Welcome to Memoria!'
    assert_select 'a.top-btn[href=?]', '#'
    assert_select 'a.top-btn[href=?]', signup_path
  end
end
