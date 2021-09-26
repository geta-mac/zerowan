class ReactionsController < ApplicationController
  def create
    reaction = Reaction.create!(
      to_user_id:   params[:to_user_id],
      to_pet_id:    params[:to_pet_id],
      from_user_id: params[:from_user_id],
      status:       params[:status]
    )
    # render  "top/show"

  end
end
