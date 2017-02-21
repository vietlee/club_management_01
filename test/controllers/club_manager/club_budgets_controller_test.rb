require 'test_helper'
class ClubManager::ClubBudgetsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get club_manager_club_budgets_create_url
    assert_response :success
  end
end
