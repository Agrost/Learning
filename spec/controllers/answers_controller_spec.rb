require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }
  let(:answer) { create(:answer, question: question, user: user) }
  describe 'GET #new' do
    before do
      sign_in(user)
      get :new, params: { question_id: question }
    end
    it 'assigns a new answer for question' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end
    it 'renders new view' do
      expect(response).to render_template :new
    end
  end
  describe 'POST #create' do
    before {sign_in(user)}
    context 'with valid attributes' do
      it 'save answer for question' do
        expect { post :create, params: {question_id: question, answer: attributes_for(:answer) }}.to change(question.answers, :count).by(1)
      end
    end
    context 'with invalid attributes' do
      it 'not save answer for question' do
        expect { post :create, params: { question_id: question, answer: attributes_for(:invalid_answer) }}.to_not change(Answer, :count)
      end
    end
  end
end
