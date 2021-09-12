class TopController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @pets = Pet.all.page(params[:page]).per(6)
  end

  def show
    @pet = Pet.find(params[:id])
      #問合せくれている方のuser_id取得
      reaction_user_ids  = Reaction.where(
        to_user_id: current_user.id, status: 'like'
      )
      #重複レコードを表示しない
      .select(:from_user_id).distinct
      #勝手にidふられてnilだから.pluckで:from_user_idを取得
      .pluck(:from_user_id)
      #.pluckで:from_user_idからUserを取得する
    @inquiries_users = User.where(id: reaction_user_ids)
  end

  def search
    @results = @q.result
    @pets = Pet.where(category:params[:q][:category])
      .where(animal_type:params[:q][:animal_type])
      .where(gender:params[:q][:gender])
      .where(avairable_area:params[:q][:avairable_area])
      .where(age:params[:q][:age])

    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  private

  def set_q
    @q = Pet.ransack(params[:q])
  end
end
