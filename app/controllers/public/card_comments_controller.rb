class Public::CardCommentsController < ApplicationController

  def create
    card = Card.find(params[:card_id])
    comment = current_customer.card_comments.new(card_comment_params)
    comment.card_id = card.id
    comment.save
    redirect_to public_card_path(card)
  end

  private

  def card_comment_params
    params.require(:card_comment).permit(:comment, :is_active)
  end
end
