class Web::Auth::SessionsController < ApplicationController
  def new
    add_breadcrumb I18n.t "sessions.controller.login", :auth_signin_path
    if User.count == 0
      User.create_first_admin
      #Section.create_default_sections Временно пока нет модели section
      flash[:notice] = I18n.t "sessions.controller.first_admin_was_created"
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or rails_admin_path
    else
      flash.now[:error] = I18n.t "sessions.controller.email_or_password_is_fail"
      render 'new'
    end    
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
