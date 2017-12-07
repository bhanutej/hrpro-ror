class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @layout = 'super_admin'
  end
end
