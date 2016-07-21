class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    params[:user_id] ? render_user_questions : render_all_questions
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

    render_unauthorized unless @question.user == current_user
  end

  private

  def question_params
    params.require(:question).permit(:title, :question_text)
  end

  def render_user_questions
    if params[:user_id].to_i == current_user.id
      @questions = current_user.questions
      render "user_questions_index"
    else
      render_unauthorized
    end
  end

  def render_all_questions
    @questions = Question.all.select { |question| question.answer_video }
  end
end
