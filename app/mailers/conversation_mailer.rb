class ConversationMailer < ApplicationMailer
  def send_conversation(conversation)
    @conversation = conversation
    puts "conversation id is #{@conversation.id}"
    @email = @conversation.email
    mail(to: @email, subject: "Here is your conversation")
  end
end