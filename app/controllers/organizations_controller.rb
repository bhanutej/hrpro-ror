class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  layout 'super_admin', only: %i(index new create)
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

  private

  def organization_params
    params.require(:organization).permit(:name, :estb_date, :domain, :description)
  end

  def address_params
    address = {}
    address[:street_address1] = params[:organization][:addresses][:street_address1]
    address[:street_address2] = params[:organization][:addresses][:street_address2]
    address[:city] = params[:organization][:addresses][:city]
    address[:state] = params[:organization][:addresses][:state]
    address[:postal_code] = params[:organization][:addresses][:postal_code]
    address[:country] = params[:organization][:addresses][:country]
    address
  end
end
