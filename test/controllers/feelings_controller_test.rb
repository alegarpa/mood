require 'test_helper'

class FeelingsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@feeling = feelings(:well)
  end

  test "should redirect create when not logged in" do
  	assert_no_difference 'Feeling.count' do
  		post :create, feeling: { status: "happy" }
  	end
  	assert_redirected_to login_url
  end


end
