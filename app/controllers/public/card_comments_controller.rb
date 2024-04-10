class Public::CardCommentsController < ApplicationController

  def create
    card = Card.find(params[:card_id])
    @comment = current_customer.card_comments.new(card_comment_params)
    @comment.card_id = card.id
    @comment.save
  end

  def update
    @card_comment = CardComment.find(params[:id])
    if @card_comment.update(card_comment_params)
      flash[:notice] = "コメントの状態を変更しました。"
    else
      flash[:alert] = "コメントの状態の変更に失敗しました。"
    end
    redirect_to public_card_path(@card_comment.card)
  end

  private

  def card_comment_params
    params.require(:card_comment).permit(:comment, :is_active)
  end
end
