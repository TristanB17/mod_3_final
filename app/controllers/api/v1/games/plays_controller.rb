class Api::V1::Games::PlaysController < ApiBaseController
  def create
    game = Game.find(params[:id])
    user = User.find(params[:user_id])
    play = user.plays.create(game_id: game.id, word: params[:word])
    render json: {message: 'Created Response'}, status:201
  end
end
