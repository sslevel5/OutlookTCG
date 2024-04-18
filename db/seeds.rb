# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or find_or_create_by!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create_by!(name: 'Luke', movie: movies.first)

Admin.find_or_find_or_create_by!_by!(
   email: 'tcg@tcg',
   password: 'tcgtcg'
)

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
  password: "aaaaaa",
  name: "User 1",
)

Customer.find_or_create_by!(
  email: "bbb@bbb",
  password: "bbbbbb",
  name: "User 2",
)

Customer.find_or_create_by!(
  email: "ccc@ccc",
  password: "cccccc",
  name: "User 3",
)

Customer.find_or_create_by!(
  email: "ddd@ddd",
  password: "dddddd",
  name: "User 4",
)

Customer.find_or_create_by!(
  email: "eee@eee",
  password: "eeeeee",
  name: "User 5",
)

Customer.find_or_create_by!(
  email: "fff@fff",
  password: "ffffff",
  name: "User 6",
)

Customer.find_or_create_by!(
  email: "ggg@ggg",
  password: "gggggg",
  name: "User 7",
)

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