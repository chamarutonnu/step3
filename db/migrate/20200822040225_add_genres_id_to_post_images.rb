class AddGenresIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :genres_id, :string
  end
end
