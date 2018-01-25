class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  # before_action :validate_subdomain
  before_action :save_return_url_to_session
  before_action :current_organization, if: :subdomain_present?
  rescue_from Pundit::NotAuthorizedError, with: :unautherized_access

  private

  def current_organization
    @current_organization ||= Organization.where(domain: request.subdomain).first
  end

  def subdomain_present?
    request.subdomain.present? ? true : false
  end

  def save_return_url_to_session
    return if !request.get? || request.xhr? || devise_controller?
    store_location_for(:user, request.fullpath)
  end

  def unautherized_access
    render(layout: false, file: "#{Rails.root}/public/401.html", status: 401) && return
  end

  def page_not_found
    render(layout: false, file: "#{Rails.root}/public/404.html", status: 404) && return
  end
end
