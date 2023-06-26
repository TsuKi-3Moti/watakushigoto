# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.create!(email: "admin@admin.com", password: "password")

users = User.create!(
  [
    {
      email: "aa@a.com",
      password: "password",
      name: "春花",
      introduction: %Q(春はあけぼの。\nやうやう白くなりゆく山ぎは、すこしあかりて、\n紫だちたる雲のほそくたなびきたる。),
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/usagi.png"), filename: "sample-user1.png")
    },

    {
      email: "bb@b.com",
      password: "password",
      name: "夏葉",
      introduction: %Q(夏は夜。月のころはさらなり。\nやみもなほ、蛍の多く飛びちがひたる。\nまた、ただ一つ二つなど、ほのかにうち光りて行くもをかし。\n雨など降るもをかし。),
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kaeru.png"), filename: "sample-user2.png")
    },

    {
      email: "cc@c.com",
      password: "password",
      name: "秋実",
      introduction: %Q(秋は夕暮れ。\n夕日のさして山の端いと近うなりたるに、\n烏の寝どころへ行くとて、三つ四つ、二つ三つなど、\n飛びいそぐさへあはれなり。\nまいて雁などのつらねたるが、\nいと小さく見ゆるはいとをかし。\n日入りはてて、風の音、虫の音など、\nはたいふべきにあらず。),
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kitsune.png"), filename: "sample-user3.png")
    },

    {
      email: "dd@d.com",
      password: "password",
      name: "冬雪",
      introduction: %Q(冬はつとめて。\n雪の降りたるはいふべきにもあらず、\n霜のいと白きも、また さらでもいと寒きに、\n火など急ぎおこして、炭もて渡るもいとつきづきし。\n昼になりて、ぬるくゆるびもていけば、\n火桶の火も白き灰がちになりてわろし。),
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/saru.png"), filename: "sample-user4.png")
    }
  ]
)

questions = Question.create!(
  [
    { title: "チョコレートについて", user_id: users[0].id },
    { title: "苦手な蛇について",       user_id: users[1].id },
    { title: "本質的欲求",     user_id: users[2].id },
    { title: "苦手な食べ物",   user_id: users[3].id }
  ]
)

Answer.create!(
  [
    {
      opinion: %Q(チョコレート系のものは好きだけど、ミルクチョコレートやホワイトチョコレートなどの甘いチョコレートは寧ろあまり好まない。\nビターチョコレートがベースのものが基本好きなので、そこが重要。\n心からおいしいと思って食べられるのはカカオ80％くらいまで。\nカカオ70%くらいがbestかも。),
      question_id: questions[0].id
    },

    {
      opinion: %Q(甘めのチョコレートは全部苦手なんだと思っていたが、きのこの山やポッキーなど、\n生地が甘くないクラッカー・プレッツェルになっていることで食べられていることに気づいた。\n\nたけのこの里がビターバージョンじゃないと食べられないのは、甘い×甘いだからで、\nトッポのビターバージョンも同じ原理だと思う。\n\nあと、クラッカーやプレッツェル生地はウイスキーなどのお酒にも合いやすい。),
      question_id: questions[0].id
    },

    {
      opinion: %Q(ヘビがずっと怖い。\n前世でヘビに襲われて亡くなったのかと思うほど怖い。\n\n★モチーフとしてのヘビは寧ろ好き\n→スリザリンとかいいなと思う。\n→デフォルメされたヘビかわいい。\nしかし、アニメーションでもリアル寄りで動いてるヘビになると厳しい。\n\n・教科書のヘビの写真でも鳥肌立つので、写真なども見れないし触れない。\n学生時代に教科書に出てきたときには、もので隠しながら授業受けてた。\n\n・よく見る悪夢に、毒蛇が地面に敷き詰められているという地獄のようなものがある。\n\n・田舎だったので遭遇率が高く、道路の真ん中でしっぽだけ轢かれてしまったヘビに出会ったときは、叫んだあと１時間は身動きが取れなかった。),
      question_id: questions[1].id
    },

    {
      opinion: %Q(カナヘビは好き\nヘビと名の付くカナヘビさんだけど、足で動いてるので、大丈夫。\n基本的にトカゲなどもかわいいと感じるタイプ\n爬虫類がだめってわけではなさそう。),
      question_id: questions[1].id
    }
  ]
)