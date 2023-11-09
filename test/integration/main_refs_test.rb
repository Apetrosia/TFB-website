require "test_helper"

class MainRefsTest < ActionDispatch::IntegrationTest

  test "wander_around_the_site" do
    get forum_path
    check_all_refs
    assert_equal 200, status

    get root_path
    check_all_refs
    assert_equal 200, status

    get info_path
    check_all_refs
    assert_equal 200, status

    get support_path
    check_all_refs
    assert_equal 200, status

    get auth_path
    assert_equal 200, status

    get root_path
    assert_equal 200, status

  end


private
  def check_all_refs
    # logo
    assert_select "img", { count: 1, src: "logo_redbread.png" }

    # references
    assert_select "a", 5
    assert_select "a", { count: 1, href: news_path, text: "Новости" }
    assert_select "a", { count: 1, href: wiki_path, text: "Вики" }
    assert_select "a", { count: 1, href: forum_path, text: "Форум" }
    assert_select "a", { count: 1, href: info_path, text: "О нас" }
    assert_select "a", { count: 1, href: support_path, text: "Обратная связь" }

    # buttons
    assert_select "form" do
      assert_select "button", "Войти"
    end
  end

end