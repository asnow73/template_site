class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_i18n_locale_from_params


  add_breadcrumb "Домой", :root_path

  protect_from_forgery with: :exception
  include Web::Admin::SessionsHelper

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash[:notice] = "#{params[:locale]} translation not available"
          logger.error flash[:notice]
        end
      end
    end
end
