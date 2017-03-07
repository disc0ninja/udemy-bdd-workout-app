class RemoveLasstNameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :lasst_name
  end
end
