require "test_helper"

class TopicTest < ActiveSupport::TestCase

  def setup
    @user = User.create(login: "test", email: "test", password_digest: "test")
    @section = Section.create(title: "test")
  end

  def test_should_not_save_without_params
    topic = Topic.new
    assert_not topic.save, "Saved topic without params"
  end

  def test_has_id
    topic = Topic.create(title: "TestTopic", user_id: @user.id, section_id: @section.id)
    assert_not_nil topic.id, "Doesn't have id"
  end

  def test_one_user_can_create_multiple_topics
    topic1 = Topic.new(title: "TestTopic1", user_id: @user.id, section_id: @section.id)
    topic2 = Topic.new(title: "TestTopic2", user_id: @user.id, section_id: @section.id)
    topic1.save
    assert topic2.save, "One user can't create multiple topics"
  end

  def test_can_have_many_comments
    topic = Topic.create(title: "TestTopic", user_id: @user.id, section_id: @section.id)
    assert_empty topic.comments, "Comments are not empty"
    topic.comments.create(text: "test", user_id: @user.id)
    assert_equal 1, topic.comments.size, "Can't create comments"
  end

end