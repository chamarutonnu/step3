class FavoritesController < ApplicationController
  def create
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    favorite = current_user.favorites.build(post_image_id: params[:post_image_id])
    favorite.save
    @post_image = PostImage.find(params[:post_image_id])
    # redirect_to post_image_path(favorite.post_image)
  end

  def destroy
    favorite = Favorite.find_by(post_image_id: params[:post_image_id], user_id: current_user.id)
    favorite.destroy
    @post_image = PostImage.find(params[:post_image_id])
    # redirect_to post_image_path(favorite.post_image)
  end
end
