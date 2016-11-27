class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && current_user.admin?
      rails_admin_url
    elsif resource.is_a?(User)
      sites_url
    else
      super
    end
  end
end
