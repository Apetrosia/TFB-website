require "test_helper"

class UserTest < ActiveSupport::TestCase

  def test_should_not_save_user_without_params
    user = User.new
    assert_not user.save, "Saved user without params"
  end

  def test_should_not_save_not_unique_login
    user1 = User.new(login: "test1", email: "test1@test.test", password: "test1")
    user2 = User.new(login: "test2", email: "test2@test.test", password: "test2")
    user2.save
    user1.login = user2.login
    assert_not user1.valid?, "Allows not unique logins"
  end

  def test_should_not_save_not_unique_email
    user1 = User.new(login: "test1", email: "test1@test.test", password: "test1")
    user2 = User.new(login: "test2", email: "test2@test.test", password: "test2")
    user2.save
    user1.email = user2.email
    assert_not user1.valid?, "Allows not unique emails"
  end

  def test_can_have_many_topics
    user = User.create(login: "test", email: "test@test.test", password: "test")
    assert_empty user.topics, "Topics are not empty"
    user.topics.create(title: "test")
    assert_equal 1, user.topics.size, "Does not create topic"
  end

  def test_can_have_many_comments
    user = User.create(login: "test", email: "test@test.test", password: "test")
    assert_empty user.comments, "Comments are not empty"
    user.comments.create(title: "test")
    assert_equal 1, user.comments.size, "Does not create comment"
  end

end