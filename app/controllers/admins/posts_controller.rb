class Admins::PostsController < ApplicationController
  def index
    @pet_user_postcount = Pet.group(:user_id).count
    # groupはカテゴリ毎に集計
    #user_id => post数を集計して、.keysで[user_idの配列]作成
    @pet_post_user_ids = Pet.group(:user_id).count.keys
    #Userテーブルから上記で抽出したidで情報抽出
    @pet_post_user = User.where(id: @pet_post_user_ids)
  end

  def show
    # groupはカテゴリ毎に集計
    #user_id => post数を集計して、.keysで[user_idの配列]作成
    @pet_post_user_ids = Pet.group(:user_id).count.keys
    #Userテーブルから上記で抽出したidで情報抽出
    @pet_post_user = User.where(id: @pet_post_user_ids)

    #Petテーブルから上記で抽出したidでポストデータ抽出
    @pet_posts = Pet.where(user_id: @pet_post_user_ids)
    # @pet_posts = User.find(@pet_user_postcount.map{|id, count| id})
    #同じ結果がでる

    #これでは全部のカウントになる。ユーザー毎にならない。
    @pet_posts_count = @pet_posts.count
  end


  def edit
  end
end
