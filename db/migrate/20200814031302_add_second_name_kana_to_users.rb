class AddSecondNameKanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :second_name_kana, :string
  end
end
