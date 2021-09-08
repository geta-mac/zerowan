class Admins::BaseController < ApplicationController
  before_action :check_admins #全体に適用
  layout 'admins/layouts/application'

  private

  #ログインしてないとき実行される（sorceryのメソッド）
  def not_authenticated
    flash[:warning] = 'ログインしてください'
    redirect_to admins_sign_up
  end

  #管理者権限がないユーザーを弾く
  def check_admins
    redirect_to root_path, warning: '権限がありません' unless current_user.admins?
  end

  def show
  end

end