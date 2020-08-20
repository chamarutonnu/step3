class AddIsSexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_sex, :boolean, default: false, null: false
  end
end
