class AddCodeNameToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :code_name, :string
  end
end
