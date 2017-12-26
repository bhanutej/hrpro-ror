class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  layout 'super_admin', only: %i(index new create show)
  include Organizations

  def index
    @organizations = get_organizations
    authorize @organizations
  end

  def new
    @organization = Organization.new
    authorize @organization
  end

  def create
    @organization = Organization.new(organization_params)
    authorize @organization
    @organization.save
  end

  def show
    @organization = get_organization(params[:id])
    authorize @organization
  end

  def update
    @organization = Organization.where(id: params[:id]).first
    authorize @organization
    @organization.update_attributes(organization_params)
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :estb_date, :domain, :description,
      addresses_attributes: [:id, :street_address1, :street_address2, :city, :state, :postal_code, :country])
  end
end
