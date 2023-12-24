
module IntegrationHelper
  def log_in(user_tag:, login: users(user_tag).login, pass:)
    open_session do |sess|
      sess.get "/auth"
      assert_equal 200, sess.status
      sess.post "/auth", params: { user: { login: login,
                                             password: pass } }
    end
  end

end