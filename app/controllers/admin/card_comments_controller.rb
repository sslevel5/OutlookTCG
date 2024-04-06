class Admin::CardCommentsController < ApplicationController

  def create
    card = card.find(params[:card_id])
    comment = current_user.card_comments.new(card_comment_params)
    comment.card_id = card.id
    comment.save
    redirect_to public_card_path(card)
  end

  private

  def card_comment_params
    params.require(:card).permit(:comment, :is_active)
  end
end
