User.create!(
  [
    {
      name:  "admin",
      email: "master@example.com",
      password:              "master",
      password_confirmation: "master",
      admin: true,
    },
    {
      name:  "gao",
      email: "123@123.com",
      password:              "123456",
      password_confirmation: "123456",
    },
    {
      name:  "guest",
      email: "guest@example.com",
      password:              "guest1",
      password_confirmation: "guest1",
    },
    {
      name:  "tony",
      email: "1234@1234.com",
      password:              "1234567",
      password_confirmation: "1234567",
    },
    {
      name:  "alice",
      email: "12345@12345.com",
      password:              "12345678",
      password_confirmation: "12345678",
    },
  ]
)

user1 = User.find(1)
user2 = User.find(2)
user3 = User.find(3)
user4 = User.find(4)
user5 = User.find(5)


Cook.create!(
  [
    {
      name: "胸肉とブロッコリー",
      user_id: 3,
      reference: "https://cookpad.com/recipe/6475971",
      required_time: 20,
      picture: open("#{Rails.root}/public/images/cook1.jpg"),
      ingredients_attributes: [
                                { name: "鶏胸肉", quantity: "300g" },
                                { name: "冷凍ブロッコリー", quantity: "250g" },
                                { name: "ニンニク ", quantity: " 好きなだけ" },
                                { name: "オリーブ油 ", quantity: "大さじ1" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "鶏挽肉のキムチ炒め丼",
      user_id: 2,
      reference: "https://cookpad.com/recipe/6449409",
      required_time: 18,
      popularity: 4,
      picture: open("#{Rails.root}/public/images/cook2.jpg"),
      ingredients_attributes: [
                                { name: "鶏むねもも挽肉", quantity: "100g" },
                                { name: "ニラ", quantity: "１束" },
                                { name: "人参", quantity: " 約1/8本" },
                                { name: "キムチ ", quantity: "40g" },
                                { name: "麦ご飯", quantity: "120g" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "一口豆腐ベーコン巻き",
      user_id: 2,
      reference: "https://delishkitchen.tv/recipes/147433420769722842",
      required_time: 15,
      popularity: 4,
      picture: open("#{Rails.root}/public/images/cook3.jpg"),
      ingredients_attributes: [
                                { name: "木綿豆腐 ", quantity: "120g" },
                                { name: "ベーコン ", quantity: "6枚" },
                                { name: "薄力粉", quantity: " 大さじ1" },
                                { name: "サラダ油", quantity: "大さじ1" },
                                { name: "塩こしょう", quantity: "適量" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
     },
     {
      name: "鶏むね肉と夏野菜の酢豚風",
      user_id: 3,
      reference: "https://delishkitchen.tv/recipes/148173434692567529",
      required_time: 15,
      popularity: 5,
      picture: open("#{Rails.root}/public/images/cook4.jpg"),
      ingredients_attributes: [
                                { name: "鶏むね肉 ", quantity: "300g" },
                                { name: "ピーマン ", quantity: "2個" },
                                { name: "なす ", quantity: " 1本" },
                                { name: "玉ねぎ ", quantity: "1/4個" },
                                { name: "酒", quantity: "大さじ1" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
      },
      {
        name: "サバのトマトソース煮",
        user_id: 3,
        reference: "https://delishkitchen.tv/recipes/139653947345338857",
        required_time: 15,
        popularity: 5,
        picture: open("#{Rails.root}/public/images/cook5.jpg"),
        ingredients_attributes: [
                                  { name: "さば（切り身)", quantity: "2切れ" },
                                  { name: "玉ねぎ ", quantity: "1/2個" },
                                  { name: "しめじ  ", quantity: " 1/2パック" },
                                  { name: "カットトマト缶  ", quantity: "1/2缶" },
                                  { name: "にんにく", quantity: "1かけ" },
                                  { name: "", quantity: "" },
                                  { name: "", quantity: "" },
                                  { name: "", quantity: "" },
                                  { name: "", quantity: "" },
                                  { name: "", quantity: "" }
                                ],
      },
      {
      name: "ねばねば丼",
      user_id: 4,
      reference: "https://recipe.rakuten.co.jp/recipe/1630002771/?l-id=recipe_list_detail_recipe",
      required_time: 30,
      popularity: 3,
      picture: open("#{Rails.root}/public/images/cook6.jpg"),
      ingredients_attributes: [
                                { name: "納豆", quantity: "1パック" },
                                { name: "めかぶ ", quantity: "めかぶ" },
                                { name: "オクラ  ", quantity: " 3本" },
                                { name: "刻みのり  ", quantity: "10g" },
                                { name: "長いも", quantity: "3cm" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "タンドリーチキン",
      user_id: 5,
      reference: "https://www.kurashiru.com/recipes/9188920f-003d-4c55-9d52-1c0917dc3aca",
      required_time: 15,
      popularity: 4,
      picture: open("#{Rails.root}/public/images/cook7.jpg"),
      ingredients_attributes: [
                                { name: "鶏むね肉", quantity: "150g" },
                                { name: "無糖ヨーグルト  ", quantity: "30g" },
                                { name: "サラダ菜 (飾り用)  ", quantity: "  2枚" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
  }  
 ]
)

cook1 = Cook.find(1)
cook2 = Cook.find(2)
cook3 = Cook.find(3)
cook4 = Cook.find(4)
cook5 = Cook.find(5)
cook6 = Cook.find(6)
cook7 = Cook.find(7)

                 
