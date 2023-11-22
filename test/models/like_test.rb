require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = User.create(login: "test", email: "test", password_digest: "test")
    @section = Section.create(title: "test")
    @topic = Topic.create(title: "test", user_id: @user.id, section_id: @section.id)
    @comment = Comment.create(text: "test", user_id: @user.id, topic_id: @topic.id)
  end
  def test_should_not_save_without_params
    like = Like.new
    assert_not like.save, "Saved like without params"
  end

  def test_has_id
    like = Like.create(comment_id: @comment.id, user_id: @user.id)
    assert_not_nil like.id, "Doesn't have id"
  end

  def test_can_create_like
    like = Like.new(comment_id: @comment.id, user_id: @user.id)
    assert section.save, "Can't create a section"
  end
end