require 'test_helper'
# FIXME: add section to database
class SectionTest < ActiveSupport::TestCase
  def test_should_not_save_without_params
    section = Section.new
    assert_not section.save, "Saved section without params"
  end

  def test_has_id
    section = Section.create(title: "test")
    assert_not_nil section.id, "Doesn't have id"
  end

  def test_can_create_section
    section = Section.new(title: "test")
    assert section.save, "Can't create a section"
  end

  def test_can_have_many_topics
    section = Section.create(title: "test")
    assert_empty section.topics, "Sections are not empty"
    user = User.create(login: "test", email: "test", password_digest: "test")
    section.topics.create(title: "test", user_id: user.id)
    assert_equal 1, section.topics.size, "Can't create topic in section"
  end
end