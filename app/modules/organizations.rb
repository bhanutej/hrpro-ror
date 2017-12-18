module Organizations

  def get_organizations
    Organization.all
  end

  def get_organization(id)
    Organization.where(id: id).first
  end  
end
