# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# モンスターを作成
monster1 = Monster.create!(
  name: 'フレイグ',
  start_battle_image_url: '/images/monsters/starts/monster1.jpg',
  end_battle_image_url: '/images/monsters/ends/monster1.jpg',
  bestiary_monster_image_url: '/images/monsters/encyclopedias/monster1.jpg'
)

monster2 = Monster.create!(
  name: 'ゲンガオレン',
  start_battle_image_url: '/images/monsters/starts/monster2.jpg',
  end_battle_image_url: '/images/monsters/ends/monster2.jpg',
  bestiary_monster_image_url: '/images/monsters/encyclopedias/monster2.jpg'
)

monster3 = Monster.create!(
  name: 'インヴェリオン',
  start_battle_image_url: '/images/monsters/starts/monster3.jpg',
  end_battle_image_url: '/images/monsters/ends/monster3.jpg',
  bestiary_monster_image_url: '/images/monsters/encyclopedias/monster3.jpg'
)

monster4 = Monster.create!(
  name: 'ブリゼリーヌ',
  start_battle_image_url: '/images/monsters/starts/monster4.jpg',
  end_battle_image_url: '/images/monsters/ends/monster4.jpg',
  bestiary_monster_image_url: '/images/monsters/encyclopedias/monster4.jpg'
)

monster5 = Monster.create!(
  name: 'オージオン',
  start_battle_image_url: '/images/monsters/starts/monster5.jpg',
  end_battle_image_url: '/images/monsters/ends/monster5.jpg',
  bestiary_monster_image_url: '/images/monsters/encyclopedias/monster5.jpg'
)

# クエストを作成
Quest.create!(
  id: 1,
  title: '焰龍のデスク大掃除',
  monster: monster1
)

Quest.create!(
  id: 2,
  title: '雷犬のリビング制圧戦',
  monster: monster2
)

Quest.create!(
  id: 3,
  title: '火獣のキッチン浄化',
  monster: monster3
)

Quest.create!(
  id: 4,
  title: '氷竜のトイレ氷結戦',
  monster: monster4
)

Quest.create!(
  id: 5,
  title: '海龍のバスルーム清掃',
  monster: monster5
)
