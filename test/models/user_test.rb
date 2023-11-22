require "test_helper"

class UserTest < ActiveSupport::TestCase

  def test_should_not_save_without_params
    user = User.new
    assert_not user.save, "Saved user without params"
  end

  def test_has_id
    user = User.create(login: "test", email: "test", password_digest: "test")
    assert_not_nil user.id, "Doesn't have id"
  end

  def test_can_be_banned
    user = User.create(login: "test", email: "test", password_digest: "test")
    assert_not user.banned?, "Initializes new user as banned"
    user.update(banned: true)
    assert user.banned?, "Can't ban user"
  end

  # def test_can_be_admin
  #   user = User.create(login: "test", email: "test", password_digest: "test")
  #   assert_not user.admin?, "Initializes new user as admin"
  #   user.update(admin: true)
  #   assert user.admin?, "Can't make user an admin"
  # end

  def test_should_not_save_not_unique_login
    user1 = User.new(login: "test1", email: "test1@test.test", password_digest: "test1")
    user2 = User.new(login: "test2", email: "test2@test.test", password_digest: "test2")
    user2.save
    user1.login = user2.login
    assert_not user1.valid?, "Allows not unique logins"
  end

  def test_should_not_save_not_unique_email
    user1 = User.new(login: "test1", email: "test1@test.test", password_digest: "test1")
    user2 = User.new(login: "test2", email: "test2@test.test", password_digest: "test2")
    user2.save
    user1.email = user2.email
    assert_not user1.valid?, "Allows not unique emails"
  end

  def test_can_have_many_topics
    user = User.create(login: "test", email: "test@test.test", password_digest: "test")
    assert_empty user.topics, "Topics are not empty"
    user.topics.create(title: "test")
    assert_equal 1, user.topics.size, "Does not create topic"
  end

  def test_can_have_many_comments
    user = User.create(login: "test", email: "test@test.test", password_digest: "test")
    assert_empty user.comments, "Comments are not empty"
    user.comments.create(text: "test")
    assert_equal 1, user.comments.size, "Does not create comment"
  end

end