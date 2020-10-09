include ApplicationHelper
def is_logged_in?
  !session[:user_id].nil?
end

def login_for_request(user)
  post login_path, params: { session: {
    email: user.email,
    password: user.password,
  } }
end

def login_for_system(user)
  visit login_path
  fill_in "user_email",    with: user.email
  fill_in "user_password", with: user.password
  click_button "ログイン"
end
