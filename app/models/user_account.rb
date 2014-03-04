class UserAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :account_type
end
