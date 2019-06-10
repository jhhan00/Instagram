class MypageController < ApplicationController
  def index
    @posts = Post.all.order('created_at desc')
    @posts_count = current_user.posts.length
    @user_id = current_user.id
  end
end
