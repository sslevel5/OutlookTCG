# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or find_or_create_by!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create_by!(name: 'Luke', movie: movies.first)

Admin.find_or_create_by!(email: 'tcg@tcg') do |admin|
  admin.password = 'tcgtcg'
  admin.password_confirmation = 'tcgtcg'
end

# レアリティ
Rarity.find_or_create_by!(name: "C")
Rarity.find_or_create_by!(name: "UC")
Rarity.find_or_create_by!(name: "R")
Rarity.find_or_create_by!(name: "AR")
Rarity.find_or_create_by!(name: "RR")
Rarity.find_or_create_by!(name: "RRR")
Rarity.find_or_create_by!(name: "SR")
Rarity.find_or_create_by!(name: "SAR")
Rarity.find_or_create_by!(name: "HR")
Rarity.find_or_create_by!(name: "UR")

# 店舗名
Store.find_or_create_by!(name: "ポンジョー")
Store.find_or_create_by!(name: "晴れてるね")
Store.find_or_create_by!(name: "カードいっぱい")
Store.find_or_create_by!(name: "ドラゴンテール")
Store.find_or_create_by!(name: "老舗カード")

Customer.find_or_create_by!(
  email: "aaa@aaa",
  name: "User 1"
) do |customer|
  customer.password = "aaaaaa"
  customer.password_confirmation = "aaaaaa"
end

Customer.find_or_create_by!(
  email: "bbb@bbb",
  name: "User 2"
) do |customer|
  customer.password = "bbbbbb"
  customer.password_confirmation = "bbbbbb"
end

Customer.find_or_create_by!(
  email: "ccc@ccc",
  name: "User 3"
) do |customer|
  customer.password = "cccccc"
  customer.password_confirmation = "cccccc"
end

Customer.find_or_create_by!(
  email: "ddd@ddd",
  name: "User 4"
) do |customer|
  customer.password = "dddddd"
  customer.password_confirmation = "dddddd"
end

Customer.find_or_create_by!(
  email: "fff@fff",
  name: "User 5"
) do |customer|
  customer.password = "ffffff"
  customer.password_confirmation = "ffffff"
end

Customer.find_or_create_by!(
  email: "eee@eee",
  name: "User 6"
) do |customer|
  customer.password = "eeeeee"
  customer.password_confirmation = "eeeeee"
end



Card.find_or_create_by!(
  title: "つるぎ",
  body: "デッキに1枚は欲しい",
  price: 100,
  rarity_id: Rarity.find_by(name: "R").id,
  store_id: Store.find_by(name: "カードいっぱい").id,
  customer_id: Customer.find_by(email: "aaa@aaa").id
) do |card|
  # カードに画像を添付する
  card.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'つるぎ.png')), filename: 'つるぎ.png')
end

Card.find_or_create_by!(
  title: "すごい竜",
  body: "環境カード",
  price: 500,
  rarity_id: Rarity.find_by(name: "R").id,
  store_id: Store.find_by(name: "ポンジョー").id,
  customer_id: Customer.find_by(email: "aaa@aaa").id
) do |card|
  # カードに画像を添付する
  card.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'すごい竜.png')), filename: 'すごい竜.png')
end

Card.find_or_create_by!(
  title: "すごい竜",
  body: "環境カード",
  price: 700,
  rarity_id: Rarity.find_by(name: "R").id,
  store_id: Store.find_by(name: "老舗カード").id,
  customer_id: Customer.find_by(email: "aaa@aaa").id
) do |card|
  # カードに画像を添付する
  card.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'すごい竜.png')), filename: 'すごい竜.png')
end

Card.find_or_create_by!(
  title: "すごい竜",
  body: "環境カード",
  price: 400,
  rarity_id: Rarity.find_by(name: "R").id,
  store_id: Store.find_by(name: "カードいっぱい").id,
  customer_id: Customer.find_by(email: "bbb@bbb").id
) do |card|
  # カードに画像を添付する
  card.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'すごい竜.png')), filename: 'すごい竜.png')
end

Card.find_or_create_by!(
  title: "すごい竜",
  body: "環境カード",
  price: 4000,
  rarity_id: Rarity.find_by(name: "UR").id,
  store_id: Store.find_by(name: "カードいっぱい").id,
  customer_id: Customer.find_by(email: "bbb@bbb").id
) do |card|
  # カードに画像を添付する
  card.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'すごい竜UR.png')), filename: 'すごい竜UR.png')
end

Card.find_or_create_by!(
  title: "破壊的な斧",
  body: "環境カード",
  price: 200,
  rarity_id: Rarity.find_by(name: "C").id,
  store_id: Store.find_by(name: "ポンジョー").id,
  customer_id: Customer.find_by(email: "bbb@bbb").id
) do |card|
  # カードに画像を添付する
  card.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', '破壊的な斧.png')), filename: '破壊的な斧.png')
end

Card.find_or_create_by!(
  title: "斧を使うもの",
  body: "デッキに1枚は欲しい",
  price: 100,
  rarity_id: Rarity.find_by(name: "HR").id,
  store_id: Store.find_by(name: "ドラゴンテール").id,
  customer_id: Customer.find_by(email: "aaa@aaa").id
) do |card|
  # カードに画像を添付する
  card.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', '斧を使うもの.png')), filename: '斧を使うもの.png')
end