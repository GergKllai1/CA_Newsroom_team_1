  class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :get_categories
  skip_before_action :verify_authenticity_token, if: :devise_controller?

  def get_categories
    @categories = Category.all
  end

  def configure_permitted_parameters
    attributes = [:first_name, :last_name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  def set_locale
    I18n.locale = I18n.available_locales.include?(params[:locale]&.to_sym) ? params[:locale] : I18n.default_locale
  end
  
  def after_sign_in_path_for(resource)
    if resource.admin?
      cms_articles_path
    else
      super
    end
  end
end

