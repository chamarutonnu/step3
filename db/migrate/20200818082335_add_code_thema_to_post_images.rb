class AddCodeThemaToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :code_thema, :string
  end
end
