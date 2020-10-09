require 'rails_helper'

RSpec.describe "お気に入り登録機能", type: :request do
  let(:user) { create(:user) }
  let(:cook) { create(:cook) }

  context "お気に入り登録処理" do
    context "ログインしていない場合" do
      it "お気に入り登録は実行できず、ログインページへリダイレクトすること" do
        expect do
          post "/favorites/#{cook.id}/create"
        end.not_to change(Favorite, :count)
        expect(response).to redirect_to login_path
      end

      it "お気に入り解除は実行できず、ログインページへリダイレクトすること" do
        expect do
          delete "/favorites/#{cook.id}/destroy"
        end.not_to change(Favorite, :count)
        expect(response).to redirect_to login_path
      end
    end
  end
end
