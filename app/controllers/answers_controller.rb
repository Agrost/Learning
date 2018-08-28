# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_answer, only: %i[destroy show update set_best]
  before_action :load_question, only: %i[new create]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def set_best
    @question = @answer.question
    @answer.set_best!
  end

  def update
    @answer.update(answer_params)
    @question = @answer.question
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    @answer.save
  end

  def destroy
    @question = @answer.question
    @answer.destroy
   end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def load_answer
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def answer_params
    params.require(:answer).permit(:body, attachments_attributes: %i[id file done _destroy])
  end
end
