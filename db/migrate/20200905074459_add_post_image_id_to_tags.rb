class AddPostImageIdToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :post_image_id, :integer
  end
end
