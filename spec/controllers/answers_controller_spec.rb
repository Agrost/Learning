# frozen_string_literal: true

RSpec.describe AnswersController, type: :controller do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:question) { create(:question, user: user) }
  let(:answer) { create(:answer, question: question, user: user) }
  describe 'GET #new' do
    before do
      sign_in(user)
      question
      answer
    end
    it 'assigns a new answer for question' do
      expect(assigns(:answer)).to_not be_a_new(Answer)
    end
    it 'renders new view' do
      expect(response).to_not render_template :new
    end
  end
  describe 'POST #create' do
    before { sign_in(user) }
    context 'with valid attributes' do
      it 'save answer for question' do
        expect { post :create, params: { question_id: question, answer: attributes_for(:answer) }, format: :js }.to change(question.answers, :count).by(1)
      end
    end
    context 'with invalid attributes' do
      it 'not save answer for question' do
        expect { post :create, params: { question_id: question, answer: attributes_for(:invalid_answer) }, format: :js }.to_not change(Answer, :count)
      end
    end
  end
  describe 'PATCH #update' do
    before do
      sign_in(user)
    end
    it 'assings the requested answer to @answer' do
      patch :update, params: { id: answer, question_id: question, answer: attributes_for(:answer), format: :js }
      expect(assigns(:answer)).to eq answer
    end
    it 'assigns th question' do
      patch :update, params: { id: answer, question_id: question, answer: attributes_for(:answer), format: :js }
      expect(assigns(:question)).to eq question
    end
    it 'changes answer attributes' do
      patch :update, params: { id: answer, question_id: question, answer: { body: 'new body' }, format: :js }
      answer.reload
      expect(answer.body).to eq 'new body'
    end
    it 'render update template' do
      patch :update, params: { id: answer, question_id: question, answer: attributes_for(:answer), format: :js }
      expect(response).to render_template :update
    end
  end
  describe 'PATCH #set_best' do
    context 'Author of question' do
      before do
        sign_in(user)
      end
      it 'changes answer best attributes' do
        patch :set_best, params: { id: answer, format: :js }
        answer.reload
        expect(answer.best).to eq true
      end
      it 'render set_best template' do
        patch :set_best, params: { id: answer, format: :js }
        expect(response).to render_template :set_best
      end
    end
    context 'Not author of question' do
      it 'tries to change best answer' do
        sign_in(user2)
        patch :set_best, params: { id: answer, format: :js }
        expect(answer.best).to eq false
      end
    end
  end
end
