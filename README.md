# 添削アプリ「てんさくん」
---
## 概要
### 「オンライン授業をより効率良く」
#### これは塾や学校などの教育機関向けの添削アプリケーションです。生徒は自由に答案を書くことができ、講師はその答案を採点しコメントを記入できます。
---
## リンク
### https://tensakun.naokijuku.com
---
## 使用技術一覧
- インフラ
  - AWS (VPC, EC2, RDS, ALB, Route53)
  - Docker, Docker-compose (開発環境)
  - CircleCI (gitHubでのプルリクエスト→Rspecのテスト実行)
- バックエンド
  - Ruby 2.6.5
  - Rails 6.0.0
  - MySQL 5.6.47
  - Devise
- フロントエンド
  - Haml
  - Scss
  - javaScript
  - jQuery
  - Ajax
- テストコード
  - Rspec
  - factory_bot
---
## 機能一覧
- ユーザー登録機能 (講師と生徒という２つの属性で登録が可能。ユーザーの属性によって使える機能が異なる)
- 簡単ログイン機能 (ユーザー登録をしなくても気軽に試せます)
- 講師ユーザーが使える機能
  - 教室部屋作成機能
  - 教室部屋削除機能
  - 答案採点・コメント機能
- 生徒ユーザーが使える機能
  - 答案作成機能
---
## アプリ制作の背景(当アプリの必要性)
当アプリは、新型コロナウイルスの蔓延によりオンライン化を余儀なくせれた教育機関で、授業における生徒の答案の添削を効率化することに役立ちます。これまでのオフラインの授業では、講師が生徒の机を巡回し添削をすることができていました。しかしオフラインではそれができません。かといって生徒が自己採点をするのは難しいです。選択問題は自己採点が可能とはいえ、国語の記述問題などは講師の判断が不可欠だからです。当アプリはこの問題を解決します。
さらに、オフラインの頃よりもさらに効率の良い添削が可能です。生徒は自分が答える問題番号と答案を記入し送信するだけです。一方、講師の端末では生徒全員の答案を時系列順に見ることができます。講師はその答案に点数とコメントを記入するだけです。答案が時系列順に並んでいるので順番が前後して生徒に不満を持たれることもありません。
講師からは全ての生徒の答案が一覧で見られますが、生徒は自分の答案しか見られないためプライバシーも守られます。また、アプリ全体が非常にシンプルな作りになっており、小学生も簡単に使いこなすことができます。
---
## 使い方
### 前提
授業自体はzoomなどのビデオ通話アプリによるオンライン授業を想定しております。当アプリはいわば答案用紙の役割を果たします。
---
#### トップページ
講師か生徒としてログインします。簡単ログインをどうぞお使いください。
<img width="1436" alt="tensakun_top" src="https://user-images.githubusercontent.com/66059951/90982140-367e5b00-e5a0-11ea-9a1d-e0aa77e8d9d2.png">

---
#### 部屋選択メニュー
参加する部屋を選びます。「(例)6-A」
<img width="1436" alt="tensakun_room" src="https://user-images.githubusercontent.com/66059951/90982148-4138f000-e5a0-11ea-8a60-89d4d632ee96.png">

---
#### 講師から見た部屋
部屋にいる全生徒の答案が表示されます。上から時系列順に並んでいるので、講師は上から添削していきます。
<img width="1431" alt="tensakun_student" src="https://user-images.githubusercontent.com/66059951/90982154-472ed100-e5a0-11ea-8754-e0f040e6706c.png">

---
#### 生徒から見た部屋
自分の答案のみが表示されます。画面下側のフォームから答案を新規投稿できます。
<img width="1435" alt="tensakun_teacher" src="https://user-images.githubusercontent.com/66059951/90982158-4b5aee80-e5a0-11ea-8e0d-e8d54960f95c.png">