class Api::V1::SessionsController < Devise::SessionsController

prepend_before_action :require_no_authentication, :only => [:create]
before_action :ensure_params_exist, only: :create

respond_to:json

def create
  contact = Contact.find_by(:email => params[:email])
  unless contact.nil?
  	if contact.valid_password? params[:password]
      render :json => contact
      return
    end

  end
  render:json => '{"error":"invalid email and password combination"}'
end

def destroy
  sign_out(resource_name)
end

protected
def ensure_params_exist
  return unless params[:email].blank?
  	render :json => {:success => false, :message => "missing email parameter"}, :status => 422
end

def invalid_login_attempt
  warden.custom_failure!
  	render:json => {:success => false, :message => "Error with your login or password"}, :status => 401
  end
end
