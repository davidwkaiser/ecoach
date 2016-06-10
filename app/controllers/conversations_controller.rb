class ConversationsController < ApplicationController
  def index
   @conversation = Conversation.new
  end

  def new
   @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      flash[:notice] = ["Let's get started!"]
      @conversation.turns << Turn.new(utterance: @conversation.first_question)
      redirect_to conversation_path(@conversation.id)
    else
      flash[:errors] = @conversation.errors.full_messages.uniq
      redirect_to '/'
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def update
    @conversation = Conversation.find(params[:id])
    if @conversation.save
      flash[:notice] = ["Your conversation will be emailed to you shortly"]
      @conversation.turns.last = ''
      ConversationMailer.send_conversation(@conversation).deliver
      redirect_to '/'
    else
      flash.errors.full_messages.uniq
      redirect_to conversation_path(@conversation.id)
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:email)
  end

end