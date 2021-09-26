class MatchingController < ApplicationController
 before_action :authenticate_user!

  def index
    # Reaction.where(to_user_id: current_user.id, status: 'like')
    # reactionsテーブルから、自分にいいねしたユーザーのレコードを取得(user_idのみでいいのでpluckメソッド使用)
    got_reaction_user_ids = Reaction.where(
      to_user_id: current_user.id,
      status: 'like'
    ).pluck(:from_user_id)

      # マッチングしたユーザー(to_user)の配列
    @match_users = Reaction.where(
      to_user_id: got_reaction_user_ids,
      from_user_id: current_user.id,
      status: 'like'
    ).map(&:to_user)
    @user = User.find(current_user.id)
  end
end
