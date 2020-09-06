class PostImagesController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

	def new
		@post_image = PostImage.new
  end

  def index
    if params[:format]
      @user = User.find(params[:format])
      if params[:own_posts] == 'true'
        @post_images = PostImage.where(user_id: @user.id).page(params[:page]).reverse_order
      elsif params[:my_favorites] == 'true'
        @post_images = @user.favorite_post_images.page(params[:page]).reverse_order
      end
    else
        @post_images = PostImage.all.page(params[:page]).reverse_order
    end
  end

  def show
    if user_signed_in?
    	@post_image = PostImage.find(params[:id])
      @comments = @post_image.comments
      @comment = current_user.comments.new
      @user = @post_image.user
    else
      @post_image = PostImage.find(params[:id])
      @user = @post_image.user
    end
  end

  def create
  	@post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    	if @post_image.save
         tags = Vision.get_image_data(@post_image.image)
         tags.each do |tag|
         @post_image.tags.create(name: tag)
      end
         redirect_to post_image_path(@post_image)
      else
      	render :new
      end
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
    redirect_to post_image_path(@post_image.id)
    else
    render "edit"
    end
  end

  def edit
    @post_image = PostImage.find(params[:id])
    if @post_image.user == current_user
        render "edit"
    else
        redirect_to users_path
    end
  end

  def destroy
  	@post_image = PostImage.find(params[:id])
  	@post_image.destroy
  	redirect_to post_images_path
  end

  private
     def post_image_params
        params.require(:post_image).permit(:image, :code_name, :code_thema, :code_explain, :category, :season, :user_name, :profile_image_id)
     end

end
