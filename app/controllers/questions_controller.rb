class QuestionsController < ApplicationController
  before_action :require_login

  def index
    @questions = Question.all.select { |question| !question.answer_video.nil? }
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

  def require_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
