class RenameGenresIdColumnToPostImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_images, :genres_id, :category
  end
end
