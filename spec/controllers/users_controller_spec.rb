require 'rails_helper'

describe UsersController, type: :controller do
  #let(:user1) { User.create!(email: "user1@mail.com", password: "random")}
  #let(:user2) { User.create!(email: "user2@mail.com", password: "random")}
  @user1 = FactoryBot.create(:user)
  @user2 = FactoryBot.create(:user)

  describe 'GET #show' do
    context 'when a user is logged in' do

      before do
        sign_in @user1
      end

      it 'loads correct user details' do
        get :show, params: { id: @user1.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq @user1
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user1.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user tries to access other users side' do

      before do
        sign_in @user2
      end

      it 'redirects to homepage' do
        get :show, params: { id: @user1.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
