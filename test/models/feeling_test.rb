require 'test_helper'

class FeelingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:archer)
  	@feeling = @user.feelings.build(status: "happy")
  end

  test "should be valid" do
  	assert @feeling.valid?
  end

  test "user id should be present" do
  	@feeling.user_id = nil
  	assert_not @feeling.valid?
  end

  test "status should be present" do
  	@feeling.status = "          "
  	assert_not @feeling.valid?
  end

  test "should be able to count occurances"
    @feeling = @user.feelings.build(status: "sad")
    
  end



end
