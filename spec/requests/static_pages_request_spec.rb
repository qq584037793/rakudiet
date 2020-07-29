require 'rails_helper'

RSpec.describe "静的ページ", type: :request do

  describe "トップページ" do
    it "正常なレスポンスを返すこと" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "楽ダイエットとは？ページ" do
    it "正常なレスポンスを返すこと" do
      get about_path
      expect(response).to have_http_status(:success)
    end
  end

end
