class RenameSeasonIdToSeason < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_images, :season_id, :string
    add_column :post_images, :season, :string
  end
end
