module Authentication
  def login(user = FactoryGirl.create(:user))
    post user_session_path, params: { 'user[email]' => user.email, 'user[password]' => user.password }
  end
end

RSpec.configure do |config|
  config.include Authentication, type: :request

  config.before :example, type: :request do
    login
  end
end
