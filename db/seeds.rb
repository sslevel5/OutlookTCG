# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'tcg@tcg',
   password: 'tcgtcg'
)

# レアリティ
Rarity.create(name: "C")
Rarity.create(name: "UC")
Rarity.create(name: "R")
Rarity.create(name: "AR")
Rarity.create(name: "RR")
Rarity.create(name: "RRR")
Rarity.create(name: "SR")
Rarity.create(name: "SAR")
Rarity.create(name: "HR")
Rarity.create(name: "UR")

# 店舗名
Store.create(name: "ポンジョー")
Store.create(name: "晴れてるね")
Store.create(name: "カードいっぱい")
Store.create(name: "ドラゴンテール")
Store.create(name: "老舗カード")

Customer.create(
  email: "aaa@aaa",
  password: "aaaaaa",
  name: "User 1",
)

Customer.create(
  email: "bbb@bbb",
  password: "bbbbbb",
  name: "User 2",
)

Customer.create(
  email: "ccc@ccc",
  password: "cccccc",
  name: "User 3",
)

Customer.create(
  email: "ddd@ddd",
  password: "dddddd",
  name: "User 4",
)

Customer.create(
  email: "eee@eee",
  password: "eeeeee",
  name: "User 5",
)

Customer.create(
  email: "fff@fff",
  password: "ffffff",
  name: "User 6",
)

Customer.create(
  email: "ggg@ggg",
  password: "gggggg",
  name: "User 7",
)