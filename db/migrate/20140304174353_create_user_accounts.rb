class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.string :access_token
      t.references :user, index: true
      t.references :account_type, index: true

      t.timestamps
    end
  end
end
