class AddUserToTests < ActiveRecord::Migration
  def change
    add_column :tests, :user, :string
  end
end
