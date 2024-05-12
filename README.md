# Outlook TCG

## サイト概要
### サイトテーマ
カードゲームショップ(実店舗)のカード価格情報比較およびカードゲーマーのコミュニティサイト

### テーマを選んだ理由
現在カードゲームショップ(実店舗)はものすごく店舗数が存在します。
1枚のカードに対しても店舗によって価格の差が存在します。その価格の差は1円から万を超える単位で差がある場合があります。
オンラインショップの価格比較サイトは存在しその中で比較することは可能です。しかし、オンラインではカードの状態を確認することはできません。
また、実店舗でしかしない特価商品なども日々存在します。そのため、カードゲーマーは実店舗を歩き回り比較し購入をします。
数ある実店舗の値段を把握し比較することは非常に難しく時間を費やします。
そこでそのカードショップに通っているユーザーやその店舗の経営者が気になるカードを画像と値段と共に投稿し比較したり、
カードについてコメントを残してコミュニケーションをしてもらうためにサイトを作成しました。

### ターゲットユーザー
- カードゲームをしているプレイヤー
- カードを集めているユーザー

### 主な利用シーン
- 気になるカードの実店舗のカードの値段を知りたいとき
- 気になるカードの実店舗のカードの値段を比較したいとき
- 気になるカードを投稿するとき
- 投稿されたカードについてコメントを残したいとき
- カードゲームのプレイヤー同士でコミュニケーションをするとき
​
## 設計書

### ER図

![ER](https://github.com/sslevel5/outlook_tcg/assets/9004618/216b68fe-0e7c-4942-ac3b-a44554abef08)
​

### 画面遷移図

#### 顧客側

![PF-user](https://github.com/sslevel5/outlook_tcg/assets/9004618/beb4ac24-ee54-4093-b75f-e6ade4ec129e)

#### 管理者側

![PF-admin](https://github.com/sslevel5/outlook_tcg/assets/9004618/c0cc0684-6db9-4abc-a402-3d00b3d7bd5c)

#### 画面プレビュー(一部)

| トップ画面|ログイン画面 |
| --------------------- | -----------|
| ![スクリーンショット (350)](https://github.com/sslevel5/outlook_tcg/assets/9004618/72d6d60a-c226-4369-bc39-9a64a5e50476)|![スクリーンショット (366)](https://github.com/sslevel5/outlook_tcg/assets/9004618/04440560-6f50-4ea1-9a15-185f0fec0e0e)|

| 新規登録画面| エラー画面例 |
| --------------------- | -----------|
|![スクリーンショット (365)](https://github.com/sslevel5/outlook_tcg/assets/9004618/2295afec-f1b5-4bc1-a9c1-f11d413764be)|![スクリーンショット (367)](https://github.com/sslevel5/outlook_tcg/assets/9004618/b7bfd95f-5bd3-42bf-ba10-3717fc194086)|

| 新規投稿画面| モーダル画面 |
| --------------------- | -----------|
|![スクリーンショット (373)](https://github.com/sslevel5/outlook_tcg/assets/9004618/68fa3c44-19a1-43c3-960e-37b9026a1da4)|![スクリーンショット (374)](https://github.com/sslevel5/outlook_tcg/assets/9004618/1b3e131c-88fd-4d80-8d0d-3b38dfc2b656)|

| 投稿詳細画面| 投稿一覧画面 |
| --------------------- | -----------|
|![スクリーンショット (375)](https://github.com/sslevel5/outlook_tcg/assets/9004618/f9488578-8d18-4538-98fd-4c3472104e1d)|![スクリーンショット (376)](https://github.com/sslevel5/outlook_tcg/assets/9004618/0ed73d7c-2d2d-407a-ac0c-e6cd4b1b6e87)|

| マイページ(投稿一覧)| マイページ(いいね一覧) |
| --------------------- | -----------|
|![スクリーンショット (377)](https://github.com/sslevel5/outlook_tcg/assets/9004618/06b38842-7f8a-402c-abaa-bd30f066c99f)|![スクリーンショット (378)](https://github.com/sslevel5/outlook_tcg/assets/9004618/c4d70332-7637-4bd1-8115-cbe9bf66b9e8)|

|トーク一覧|トークルーム|
| --------------------- | -----------|
|![スクリーンショット (379)](https://github.com/sslevel5/outlook_tcg/assets/9004618/dc46b5b1-c3d6-437e-8db0-d0040ccded99)|![スクリーンショット (380)](https://github.com/sslevel5/outlook_tcg/assets/9004618/1e509542-2908-4f8f-979d-04b143d82e6e)|

|お問い合せ履歴|お問い合せフォーム|
| --------------------- | -----------|
|![スクリーンショット (360)](https://github.com/sslevel5/outlook_tcg/assets/9004618/d6d23e48-b0b4-437c-8fb4-723006c49f77)|![スクリーンショット (361)](https://github.com/sslevel5/outlook_tcg/assets/9004618/58f9ac22-e290-4e3c-ab27-32252b4c87f8)|

|お問い合せ確認|お問い合せ完了|
| --------------------- | -----------|
|![スクリーンショット (362)](https://github.com/sslevel5/outlook_tcg/assets/9004618/2fd6f992-5957-4857-b3ca-cca9d7f9acda)|![スクリーンショット (363)](https://github.com/sslevel5/outlook_tcg/assets/9004618/8ee5adee-0632-4a79-855f-97865a1b0cb9)|

|レスポンシブ(投稿一覧)|(トーク一覧)|(検索ページ)|
|------------|---|-------------|
![スクリーンショット (382)](https://github.com/sslevel5/outlook_tcg/assets/9004618/6c9e6f38-a2cd-4b3c-84d0-a88ac3e8eb87)|![スクリーンショット (383)](https://github.com/sslevel5/outlook_tcg/assets/9004618/cd6bed0d-068d-4ef3-adec-a971211a433b)|![スクリーンショット (384)](https://github.com/sslevel5/outlook_tcg/assets/9004618/6673aefe-6586-4baf-9d4f-44b796b643d8)|

## 開発環境
- OS: Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- Bootstrap
- IDE：Cloud9


## 使用Gem

```
gem 'devise'
gem 'jquery-rails'
gem 'enum_help'
```

## 使用技術

[![](https://img.shields.io/badge/Ruby-CC342D?style=flat&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=flat&logo=ruby-on-rails&logoColor=white)](https://rubyonrails.org/)
[![](https://img.shields.io/badge/HTML-1572B6?style=flat&logo=html5&logoColor=white&color=orange)](https://example.com)
[![](https://img.shields.io/badge/CSS-1572B6?style=flat&logo=css3&logoColor=white)](https://www.w3.org/Style/CSS/Overview.en.html)
[![](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![](https://img.shields.io/badge/Bootstrap-563D7C?style=flat&logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/)
[![](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white)](https://git-scm.com/)
[![](https://img.shields.io/badge/Amazon_AWS-232F3E?style=flat&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![](https://img.shields.io/badge/Amazon_EC2-232F3E?style=flat&logo=amazon-ec2&logoColor=white)](https://aws.amazon.com/ec2/)
[![](https://img.shields.io/badge/Amazon_RDS-232F3E?style=flat&logo=amazon-rds&logoColor=white)](https://aws.amazon.com/rds/)
[![](https://img.shields.io/badge/Nginx-009639?style=flat&logo=nginx&logoColor=white)](https://nginx.org/)
[![](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)](https://www.mysql.com/)


## 使用方法

### インストール

```
$ git clone git@github.com:sslevel5/outlook_tcg.git
$ cd outlook_tcg
$ bundle install
$ rails db:migrate
$ rails db:seed
```

## 使用素材

カードや店舗はフリー素材や自作で代用し、実名は避けて使用します。

以下、フリーイラストサイト
- <a href="https://illustcenter.com/category/leisure/hobby/" target="_blank">イラストセンター</a>：https://illustcenter.com/category/leisure/hobby/