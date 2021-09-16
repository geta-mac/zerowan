class Admins::BaseController < ApplicationController
  before_action :authenticate_admin!
  #layout 'admins/layouts/application'

  def index
    
  end
  
  private

  #ログインしてないとき実行される（sorceryのメソッド）
  def not_authenticated
    flash[:warning] = 'ログインしてください'
    redirect_to admins_sign_up
  end

  def show
  end

end