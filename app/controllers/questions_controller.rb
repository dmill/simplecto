class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = current_user.questions
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.create(question_params)

    render action: "show"
  end

  def show
  end

  private

  def question_params
    params.require(:question).permit(:title, :question_text)
  end
end
