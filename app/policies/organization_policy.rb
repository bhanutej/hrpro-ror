class OrganizationPolicy < ApplicationPolicy
  def index?
    user.present? && user.super_admin?
  end
  alias new? index?
  alias create? index?
  alias show? index?
  alias update? index?
end
