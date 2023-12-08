require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(login: "test", email: "test", password_digest: "test")
    @section = Section.create(title: "test")
    @topic = Topic.create(title: "test", user_id: @user.id, section_id: @section.id)
  end

  def test_should_not_save_without_params
    comment = Comment.new
    assert_not comment.save, "Saved comment without params"
  end

  def test_can_create_comment
    comment = Comment.new(text: "test", user_id: @user.id, topic_id: @topic.id)
    assert comment.save, "Can't create comment"
  end

  def test_has_id
    comment = Comment.new(text: "test", user_id: @user.id, topic_id: @topic.id)
    assert_not_nil comment.id, "Doesn't have id"
  end

  def test_can_have_replies
    comment = Comment.save(text: "test", user_id: @user.id, topic_id: @topic.id)
    comment1 = Comment.new(text: "test", user_id: @user.id, topic_id: @topic.id, parent_msg_id: comment.id)
    assert comment1.save, "Can't create reply to comment"
  end

  def test_can_have_many_likes
    comment = Comment.create(text: "test", user_id: @user.id, topic_id: @topic.id)
    assert_empty comment.likes, "Likes are not empty"
    comment.likes.create(user_id: @user.id)
    assert_equal 1, comment.likes.size, "Can't like comment"
  end
end