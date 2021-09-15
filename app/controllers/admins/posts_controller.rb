class Admins::PostsController < ApplicationController
  def index
    @pet_user_postcount = Pet.group(:user_id).count
  end

  def show
    # groupはカテゴリ毎に集計したい時に使用
    @pet_post_user_ids = Pet.group(:user_id).count.keys
    @pet_posts = Pet.where(user_id: @pet_post_user_ids)

  end


  def edit
  end
end
