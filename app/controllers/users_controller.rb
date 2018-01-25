class UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'super_admin', only: %i(index new)
  include Organizations

  def index
  end

  def new
    @organization = get_organization(params[:id])
    @user = User.new
  end

end
