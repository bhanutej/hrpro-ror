class RegistrationsController < Devise::RegistrationsController
  include Organizations

  def create
    @organization = get_organization(params[:id])
    @user =
      if params[:user][:role] != 'manager'
        create_user_with_manager
      else
        @organization.users.create(user_params)
      end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :contact, :password, :password_confirmation,
      :bank_name, :account_number, :emp_id, :blood_group, :date_of_join, :date_of_birth, :role, :designation,
      address_attributes: [:id, :street_address1, :street_address2, :city, :state, :postal_code, :country])
  end

  def create_user_with_manager
    report_manager = @organization.users.where(id: params[:user][:manager]).first
    user = @organization.users.new(user_params)
    user.manager = report_manager
    user.save
    user
  end
end
