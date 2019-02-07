class ApplicationController < ActionController::API

  acts_as_token_authentication_handler_for User
  #protect_from_forgery with: :null_session

  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::ImplicitRender
  #before_action :authenticate


  protected

  def authenticate

    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end
  end


  private

    def current_user
      
      user_email = request.headers["X-User-Email"].presence
      user = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, request.headers["X-User-Token"])
          user = User.find_by_email(user_email)
        return user
      else
      render :json => '{"success" : "false"}'
      end

    end

    def authenticate_user_from_token!
      user_email = request.headers["X-User-Email"].presence
      user = user_email && User.find_by_email(user_email)

      # Notice how we use Devise.secure_compare to compare the token
      # in the database with the token given in the params, mitigating
      # timing attacks.
      if user && Devise.secure_compare(user.authentication_token, request.headers["X-User-Token"])
          user = User.find_by_email(user_email)
        return true
      else
      render :json => '{"success" : "false"}'
      end
    end


end
