class SessionsController < Devise::SessionsController
  def create
    subdomain ||= request.subdomain
    email = params[:user][:email].downcase
    user = User.where(email: email).last
    organization ||= Organization.where(domain: subdomain).first
    if subdomain.present?
      if user.present?
        validate_password_and_redirect(user, params[:user][:password]) if organization.users.include? user
        unautherized_access if user.role == 'super_admin'
      else
        flash[:email] = 'Please provide valid email'
        redirect_to root_path
      end
    else
      if user.present?
        user.role != 'super_admin' ? unautherized_access : validate_password_and_redirect(user, params[:user][:password])
      else
        flash[:email] = 'Please provide valid email'
        redirect_to root_path
      end
    end
  end

  private

  def validate_password_and_redirect(user, password)
    sign_in(user) if user.valid_password?(password)
    flash[:password] = 'Wrong password' if user.valid_password?(password)
    redirect_to root_path
  end

  def unautherized_access
    render(layout: false, file: "#{Rails.root}/public/401.html", status: 401) && return
  end

end
