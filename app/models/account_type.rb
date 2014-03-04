class AccountType < ActiveRecord::Base
  belongs_to :user
  belongs_to :account_type
  def self.insert_account_type
  end
end
