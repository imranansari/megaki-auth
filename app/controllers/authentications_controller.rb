class AuthenticationsController < ApplicationController
  
  def create
    auth = params['auth']
  	user = User.where(email: auth[:email]).first
  	account_type = AccountType.where(name: auth['type'])
  	if user.blank?
  		user = User.create(email: auth[:email], first_name: auth[:first_name], last_name: auth[:last_name], company_name: auth[:company_name])
  		user.user_accounts.create(access_token: auth[:access_token], account_type_id: account_type.id)
  	else
  		user_account = user.user_accounts.where(account_type_id: account_type.id).first
  		user_account.update_attributes(access_token: params[:user][:access_token])
  	end
  	sign_in(user)
  	flash[:notice] = "You have authenticated successfully."
  	redirect_to root_url
  end

end
