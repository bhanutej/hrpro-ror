class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  layout 'super_admin', only: %i(index new create show)
  include Organizations

  def index
    @organizations = get_organizations
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.create(organization_params)
  end

  def show
    @organization = get_organization(params[:id])
  end

  def update
    @organization = Organization.where(id: params[:id]).first
    @organization.update_attributes(organization_params)
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :estb_date, :domain, :description,
      addresses_attributes: [:id, :street_address1, :street_address2, :city, :state, :postal_code, :country])
  end
end
