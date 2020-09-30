class HomesController < ApplicationController
  def top
    @famous_users = User.where(id: User.joins(:post_images).group(:id).count("post_images.id").sort {|a,b| a[1]<=>b[1]}.last(5).map{|x| x.first}.last(5))
    # @popular = PostImage.where(id: PostImage.joins(:favorites).group(:id).count("favorites.id").sort {|a,b| a[1]<=>b[1]}.last(5).map{|x| x.first}.last(5))
    counts = PostImage.joins(:favorites).group(:id).order("count_all desc").count
    @popular = PostImage.find(counts.map{|id, count| id})
  end

  def about
  end

  def search_season
    @famous_users = User.where(id: User.joins(:post_images).group(:id).count("post_images.id").sort {|a,b| a[1]<=>b[1]}.last(5).map{|x| x.first}.last(5))
    @post_images = PostImage.where(season: params[:season]).page(params[:page]).per(9)
    render :search
  end

  def search_category
    @famous_users = User.where(id: User.joins(:post_images).group(:id).count("post_images.id").sort {|a,b| a[1]<=>b[1]}.last(5).map{|x| x.first}.last(5))
    @post_images = PostImage.where(category: params[:category]).page(params[:page]).per(9)
    render :search
  end

end