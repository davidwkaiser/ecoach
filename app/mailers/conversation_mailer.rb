class ConversationMailer < ApplicationMailer
  def send_conversation(conversation)
    @conversation = conversation
    @email = @conversation.email
    mail(to: @email, subject: "Here is your conversation")
  end
end