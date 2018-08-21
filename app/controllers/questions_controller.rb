# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :index, :show]
  before_action :load_owner, only: [:destroy, :edit]

  def show
    @answer = @question.answers.build
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end


  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id

    if @question.save
      flash[:notice] = 'Your question successfully created.'
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def load_owner
    if @question.user_id != current_user.id
      redirect_to root_path
      flash[:notice] = 'You cannot do this'
    end
  end

  private

  def load_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
