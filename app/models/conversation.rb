class Conversation < ActiveRecord::Base
  has_many  :turns
  validates :email, presence: true

  FIRST_QUESTION = "What would you like to get from our session today?"
  QUESTIONS = [
    "What bad thing might happen if you got what you want?",
    "Can you give me some more detail about that?",
    "Who might get upset at you if you made that change?",
    "What would you have to give up to do that?",
    "What is one small step you could take to realize that?",
    "What is important about that to you?",
    "How will you feel if you can't make that happen?",
    "What is another way you could get that result?"
  ]

  def first_question
    FIRST_QUESTION
  end

  def self.question
    QUESTIONS.sample
  end
end