class QuestionsController < ApplicationController
  before_action :authenticate_user!

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

    render_unauthorized unless @question.user == current_user
  end

  private

  def question_params
    params.require(:question).permit(:title, :question_text)
  end
end
