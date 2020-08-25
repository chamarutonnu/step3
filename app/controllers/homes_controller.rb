class HomesController < ApplicationController
  def top
    @famous_users = User.where(id: User.joins(:post_images).group(:id).count("post_images.id").sort {|a,b| a[1]<=>b[1]}.last(5).map{|x| x.first}.last(5))
  end

  def about
  end
end
