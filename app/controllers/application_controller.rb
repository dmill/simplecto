class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    questions_path
  end

  def render_unauthorized
    render html: "Unauthorized", status: :unauthorized
  end
end
