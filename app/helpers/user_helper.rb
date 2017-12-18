module UserHelper
  def managers
    @organization.users.where(role: 'manager')
  end
end
