class HomesController < ApplicationController
  def top
    @famous_users = User.where(id: User.joins(:post_images).group(:id).count("post_images.id").sort {|a,b| a[1]<=>b[1]}.last(5).map{|x| x.first}.last(5))
    @post_images = PostImage.all
  end

  def about
  end
# 仮の遷移先
  def search_season
    @famous_users = User.where(id: User.joins(:post_images).group(:id).count("post_images.id").sort {|a,b| a[1]<=>b[1]}.last(5).map{|x| x.first}.last(5))
    @post_images = PostImage.where(season: params[:season]).page(params[:page]).per(9)
    render :search
  end

  def serach_category
    @famous_users = User.where(id: User.joins(:post_images).group(:id).count("post_images.id").sort {|a,b| a[1]<=>b[1]}.last(5).map{|x| x.first}.last(5))
    @post_images = PostImage.where(category: params[:category]).page(params[:page]).per(9)
    render :search
  end

end