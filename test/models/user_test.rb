require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    ActionMailer::Base.deliveries.clear
  end

  def assert_mail_count(count)
    assert_equal count, ActionMailer::Base.deliveries.count
  end

  test "With valid params and class method" do
    user = User.invite!(email: 'new_user@example.com', name: 'John Doe')
    assert user.persisted?
    assert_mail_count(1)
  end

  test "With invalid params and class method" do
    user = User.invite!(email: 'new_user@example.com', name: '')
    refute user.persisted?
    assert_mail_count(0)
  end

  test "With valid params and instance method" do
    user = User.new(email: 'new_user@example.com', name: 'John Doe')
    user.invite!
    assert user.persisted?
    assert_mail_count(1)
  end

  test "With invalid params and instance method" do
    user = User.new(email: 'new_user@example.com', name: '')
    user.invite!
    assert user.persisted?
    assert_mail_count(1)
  end
end
