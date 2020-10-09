require 'rails_helper'

RSpec.describe "コメント機能", type: :request do
  let!(:user) { create(:user) }
  let!(:cook) { create(:cook) }
  let!(:comment) { create(:comment, user_id: user.id, cook: cook) }

  context "コメントの登録" do
    context "ログインしている場合" do
      before do
        login_for_request(user)
      end

      it "有効な内容のコメントが登録できること" do
        expect {
          post comments_path, params: { cook_id: cook.id,
                                        comment: { content: "最高です！" } }
        }.to change(cook.comments, :count).by(1)
      end

      it "無効な内容のコメントが登録できないこと" do
        expect {
          post comments_path, params: { cook_id: cook.id,
                                        comment: { content: "" } }
        }.not_to change(cook.comments, :count)
      end
    end

    context "ログインしていない場合" do
      it "コメントは登録できず、ログインページへリダイレクトすること" do
        expect {
          post comments_path, params: { cook_id: cook.id,
                                        comment: { content: "最高です！" } }
        }.not_to change(cook.comments, :count)
        expect(response).to redirect_to login_path
      end
    end
  end
end
