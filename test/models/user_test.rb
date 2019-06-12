require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "With valid params and class method" do
    user = User.invite!(email: 'new_user@example.com', name: 'John Doe')
    assert user.persisted?
  end

  test "With invalid params and class method" do
    user = User.invite!(email: 'new_user@example.com', name: '')
    refute user.persisted?
  end
end
