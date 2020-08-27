class RemoveLastNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :lastname, :string
  end
end
