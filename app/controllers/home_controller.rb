class HomeController < ApplicationController
  before_action :authenticate_user!

  include Organizations

  def index
    @layout = 'super_admin'
    @organizations = get_organizations
  end
end
