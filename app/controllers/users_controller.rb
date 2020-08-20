class UsersController < ApplicationController

	def index
	end

	def show
		@user = User.find(params[:id])
		@post_images = @user.post_images.page(params[:page]).reverse_order
		@favorite_post_image = @user.favorite_post_image

	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
       redirect_to user_path(current_user)
    end
	end

	def destroy
	end

	def create
		user.save
		redirect_to_users_path
	end

	def update
		@user = User.find(params[:id])
    if @user.update(user_params)
   	flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render "edit"
  	end
	end

	def withdrawal
    @user = User.find(current_user.id)
  end

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

	private
  def user_params
    params.require(:user).permit(:name, :first_name, :second_name, :first_name_kana, :second_name_kana, :profile_image, :email, :password, :password_confirmation, :is_deleted, :user_name, :infroduction, :is_sex)
  end

end
