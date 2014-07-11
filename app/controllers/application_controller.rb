class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_i18n_locale_from_params


  add_breadcrumb (I18n.t "application.controller.home"), :root_path

  protect_from_forgery with: :exception
  include Web::Auth::SessionsHelper

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def not_authenticated
    # Make sure that we reference the route from the main app.
    # redirect_to admin_signin_path
    redirect_to auth_signin_path
  end

  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash[:warning] = "#{params[:locale]} translation not available"
          logger.error flash[:warning]
        end
      end
    end
end
