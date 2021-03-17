require 'test_helper'

class ListingControllerTest < ActionDispatch::IntegrationTest
  test "should get Pops" do
    get listing_Pops_url
    assert_response :success
  end

end
