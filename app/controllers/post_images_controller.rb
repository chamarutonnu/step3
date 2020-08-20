class PostImagesController < ApplicationController
	def new
		@post_image = PostImage.new
  end

  def index
  	@post_images = PostImage.all
  end

  def show
  	@post_image = PostImage.find(params[:id])
    @comments = @post_image.comments
    @comment = current_user.comments.new
  end

  def create
  	@post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    	if @post_image.save
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
  end

  def destroy
  	@post_image = PostImage.find(params[:id])
  	@post_image.destroy
  	redirect_to post_images_path
  end

  private
     def post_image_params
        params.require(:post_image).permit(:image, :code_name, :code_thema, :code_explain)
     end

end
