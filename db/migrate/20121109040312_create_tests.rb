class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :subject
      t.string :quarter
      t.string :course
      t.string :grade
      t.string :link

      t.timestamps
    end
  end
end
