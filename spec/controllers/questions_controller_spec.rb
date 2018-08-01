require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe 'GET #index' do
    let(:questions) {FactoryBot.create(:question)}
    before do
      get :index
    end

    it 'populates an array of all questions' do
      expect(assigns(:questions)).to match_array([questions])
    end

    it 'rendet index view' do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'GET #show' do
    let(:question) { create(:question)}
    it 'assings the requested question to @question' do
      get :show, params: { id: question }
      expect(assigns(:question)).to eq question
    end

    it 'renders show view' do
      get :show, params: { id: question }
      expect(response).to render_template :show
    end
  end
end
