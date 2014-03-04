class AuthenticationsController < ApplicationController
  
  def create
  	user = User.where(email: params[:user][:email]).first
  	account_type = AccountType.where(name: auth['type'])
  	if user.blank?
  		user = User.create(email: params[:user][:email])
  		user.user_accounts.create(access_token: params[:user][:access_token], account_type_id: account_type.id)
  	else
  		user_account = user.user_accounts.where(account_type_id: account_type.id).first
  		user_account.update_attributes(access_token: params[:user][:access_token])
  	end
  	sign_in(user)
  	flash[:notice] = "You have authenticated successfully."
  	redirect_to root_url
  end

end
