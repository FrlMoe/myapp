require 'rails_helper'

describe ProductsController, type: :controller do
  let(:user) { User.create!(email: "user@testmail.com", password: "password") }
  let(:product) { Product.create!(name: "bike", description: "text", image_url: "image.jpg") }


  describe 'GET #index' do
    it 'renders products index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'renders products show page' do
      get :show, params: {id: product.id}
      expect(response).to be_ok
    end
  end

  describe 'GET #new' do
    context 'when user is admin' do
      before do
        sign_in user
      end

      it 'renders new product page' do
        get :new, params: {id: product.id}
        expect(response).to be_ok #got false
      end
    end
   end

   describe 'GET #edit' do
     context 'when user is admin' do
       before do
         sign_in user
       end

       it 'renders edit product page' do
         get :edit, params: {id: product.id}
         expect(response).to be_ok #got false
       end
    end


    context 'when user is logged in but not admin' do
      before do
        sign_in user
      end

      it 'can not edit product' do
        get :edit, params: {id: product.id}
        expect(response).to redirect_to(simple_pages_index_path) #wrong path
      end
    end
  end

    describe 'POST #create' do
      context 'when user is admin' do
        before do
          sign_in user
        end

        it 'creates a new product' do
          expect(response).to be_successful
        end
      end

      context  'when user is not admin' do
        before do
          sign_in user
        end

        it 'can not create new product' do
          expect(response).to be_successful #got true
          expect(response).to redirect_to(simple_pages_index_path)
        end
      end
    end

    describe 'DELETE #destroy' do
      context 'when user is admin'
        before do
          sign_in user
        end

        it 'destroys product' do
          delete :destroy, params: {id: product.id}
          expect(response).to redirect_to(simple_pages_index_path) #wrong path
        end
      end
    end
