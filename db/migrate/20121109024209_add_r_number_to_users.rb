class AddRNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rnumber, :integer
  end
end
