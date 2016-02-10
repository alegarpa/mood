require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: "Billy Joe", email: "bill@ex.com")
  end

  test "should be valid" do
  	assert @user.valid?
  end
end


