class QuestionsController < ApplicationController

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
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:title, :question_text)
  end
end
