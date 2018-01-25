class HomeController < ApplicationController
  before_action :authenticate_user!

  include Organizations

  def index
    if current_user.role == 'super_admin'
      @layout = 'super_admin'
      @organizations = get_organizations
    elsif current_user.role == 'admin'
      @layout = 'admin'
    end
  end

end
