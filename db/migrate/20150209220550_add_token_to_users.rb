class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string
    add_index  :users, :authentication_token

    User.find_each(&:save)
  end
end
