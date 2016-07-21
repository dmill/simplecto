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

    if !current_user.subscribed && current_user.questions.count > 1
      redirect_to new_subscription_path
    else
      render action: "show"
    end
  end

  def show
    @question = Question.find(params[:id])

    unless @question.user == current_user || current_user.subscribed
      redirect_to new_subscription_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :question_text)
  end

  def render_user_questions
    if params[:user_id].to_i == current_user.id
      @questions = current_user.questions
    else
      redirect_to new_subscription_path
    end
  end

  def render_all_questions
    @questions = Question.all.select { |question| question.answer_video }
  end
end
