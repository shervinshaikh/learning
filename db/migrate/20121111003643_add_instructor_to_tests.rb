class AddInstructorToTests < ActiveRecord::Migration
  def change
    add_column :tests, :instructor, :string
  end
end
