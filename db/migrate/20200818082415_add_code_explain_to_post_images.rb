class AddCodeExplainToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :code_explain, :string
  end
end
