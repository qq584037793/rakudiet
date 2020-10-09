require 'rails_helper'

RSpec.describe Cook, type: :model do
  let!(:cook) { create(:cook) }

  context "バリデーション" do
    it "有効な状態であること" do
      expect(cook).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      cook = build(:cook, name: nil)
      cook.valid?
      expect(cook.errors[:name]).to include("を入力してください")
    end

    it "名前が30文字以内であること" do
      cook = build(:cook, name: "あ" * 31)
      cook.valid?
      expect(cook.errors[:name]).to include("は30文字以内で入力してください")
    end

    it "説明が140文字以内であること" do
      cook = build(:cook, description: "あ" * 141)
      cook.valid?
      expect(cook.errors[:description]).to include("は140文字以内で入力してください")
    end

    it "コツ・ポイントが50文字以内であること" do
      cook = build(:cook, tips: "あ" * 51)
      cook.valid?
      expect(cook.errors[:tips]).to include("は50文字以内で入力してください")
    end

    it "ユーザーIDがなければ無効な状態であること" do
      cook = build(:cook, user_id: nil)
      cook.valid?
      expect(cook.errors[:user_id]).to include("を入力してください")
    end

    it "人気度が1以上でなければ無効な状態であること" do
      cook = build(:cook, popularity: 0)
      cook.valid?
      expect(cook.errors[:popularity]).to include("は1以上の値にしてください")
    end

    it "人気度が5以下でなければ無効な状態であること" do
      cook = build(:cook, popularity: 6)
      cook.valid?
      expect(cook.errors[:popularity]).to include("は5以下の値にしてください")
    end
  end
end
