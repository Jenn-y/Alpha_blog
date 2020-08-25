ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def sign_in_as(admin)
    post login_path, params: { session: { email: admin.email, password: "123456"} }
  end
end
