require 'test_helper'

class CompetitionControllersTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get competition_name:string_url
    assert_response :success
  end

end
