require "test_helper"

class TopicTest < ActiveSupport::TestCase

  def test_should_not_save_user_without_params
    topic = Topic.new
    assert_not topic.save, "Saved user without params"
  end

  def test_one_user_can_create_multiple_topics
    topic1 = Topic.new(title: "TestTopic1", user_id: "u1")
    topic2 = Topic.new(title: "TestTopic2", user_id: "u1")
    topic1.save
    assert topic2.save, "One user can't create multiple topics"
  end


end