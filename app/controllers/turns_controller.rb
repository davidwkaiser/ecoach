class TurnsController < ApplicationController
  def new
    @turn = Turn.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @turn = @conversation.turns.create(turn_params)
    @conversation.turns << Turn.new(utterance: Conversation.question)
    redirect_to conversation_path(@conversation)
  end

  def get_question
    Conversation.question
  end



  private

  def turn_params
    params.require(:turn).permit(:utterance)
  end
end