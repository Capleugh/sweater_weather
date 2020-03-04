class RemoveAuthTokenColumnFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :auth_token, :string
  end
end
