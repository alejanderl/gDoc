class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  before_filter :authorize
  delegate :allow?, to: :current_permission
  helper_method :allow?
  

  
  private
  
    def current_permission
    @current_permission ||= Permission.new(current_user)
  end
  
  def authorize
    if !current_permission.allow?(params[:controller], params[:action])
      redirect_to root_url, alert: "Not authorized.#{params[:controller].to_s} #{params[:action
                                                                                        ].to_s},"
    end
    
  end


  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
    # current_user.locale
    # request.subdomain
    # request.env["HTTP_ACCEPT_LANGUAGE"]
    # request.remote_ip
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

end
