class AddSeasonIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :season_id, :string
  end
end
