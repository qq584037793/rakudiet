require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "トップページ" do
    context "ページ全体" do
      before do
        visit root_path
      end

      it "楽ダイエットの文字列が存在することを確認" do
        expect(page).to have_content '楽ダイエット'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title
      end
    end
  end

  describe "ヘルプページ" do
    before do
      visit about_path
    end

    it "楽ダイエットとは？の文字列が存在することを確認" do
      expect(page).to have_content '楽ダイエットとは？'
    end

    it "正しいタイトルが表示されることを確認" do
      expect(page).to have_title full_title('楽ダイエットとは？')
    end
  end
end
  

