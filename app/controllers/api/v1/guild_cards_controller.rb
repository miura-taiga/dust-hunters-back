class Api::V1::GuildCardsController < ApplicationController
  def show
    if @current_user
      guild_cards = GuildCard.where(user_id: @current_user.id)
      render json: guild_cards, each_serializer: GuildCardSerializer, status: :ok
    else
      render json: { error: '認証情報を取得できません' }, status: :unauthorized
    end
  end

  private

  def guild_card_params
    params.require(:guild_card).permit(:defeat_count)
  end
end
