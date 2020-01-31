# frozen_string_literal: true

# Set user_token cookie after sign in
Warden::Manager.after_set_user do |user, auth, opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}_token"] = user.id
end

# Invalidate user.id cookie on sign out
Warden::Manager.before_logout do |user, auth, opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}_token"] = nil
end
