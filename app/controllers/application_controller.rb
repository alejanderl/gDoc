class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale

  before_filter :authorize
  delegate :allow?, to: :current_permission
  helper_method :allow?
  delegate :allow_param?, to: :current_permission
  helper_method :allow_param?
  before_filter :set_locale_from_url
  before_filter :set_default_appearance

  def set_default_appearance
    @appearance= Appearance.first
  end

  
  def add_terms(taxonomy_array,object)
    # Check if exist instead of deleting when everything is properly working ;-)
        object.terms.destroy_all
        taxonomy_array.each do |terms_ids|
          terms_ids = terms_ids[1].split(",")
          terms_ids.uniq!
          terms_ids.reject! {|x| x=="undefined"}
          terms_ids.reject! {|x| x==""}
          terms_ids.each do |term_id|
          instance_variable_set("@taxonomizable_#{term_id}", object.taxonomizables.build )
          eval("@taxonomizable_#{term_id}.term_id = term_id")
        end
    end
  end
  
  
  def sanitize_filename(filename)
    # Split the name when finding a period which is preceded by some
    # character, and is followed by some character other than a period,
    # if there is no following period that is followed by something
    # other than a period (yeah, confusing, I know)
    fn = filename.split(/(?<=.)\.(?=[^.])(?!.*\.[^.])/m)
  
    # We now have one or two parts (depending on whether we could find
    # a suitable period). For each of these parts, replace any unwanted
    # sequence of characters with an underscore
    fn.map! { |s| s.gsub(/[^a-z0-9\-]+/i, '_') }
  
    # Finally, join the parts with a period and return the result
     fn.join '.'
  end

    
  private
  
  def current_permission

    @current_permission ||= Permission.new(current_user)
  end
  
  def current_resource
    nil
  end
  
  def authorize
    
    if current_permission.allow?(params[:controller], params[:action], current_resource)
      current_permission.permit_params! params
    else
      redirect_to root_url, alert: "Not authorized."
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
