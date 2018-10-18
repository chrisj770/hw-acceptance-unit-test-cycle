class AddDirectorField < ActiveRecord::Migration
  def change
    remove_column :movies, :director
    add_column :movies, :director, :string
  end
end
