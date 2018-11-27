# rubyでは複数のデータを扱う場合、配列(array)と連想配列(hash)を利用します。

# array 要素を複数個格納できるクラス
# 宣言
p archers = ["ナポレオン", "エミヤ", "ロビンフッド", "アーラシュ"]

# 要素の追加・削除
p archers.push("新宿のアーチャー") # 要素を追加するメソッドや
p archers.delete_at(archers.length - 1) # 削除するメソッドも用意されています。
p archers # 現状を確認してみましょう

# 先頭の参照
p archers.first # 一番最初を呼び出すメソッドも用意されてる。
p archers[0] # 添え字でも呼び出せます。
# 末尾の参照
p archers.last # 一番最後を参照するメソッドも用意されてるし、
p archers[-1] # そもそも-1で末尾から参照していってくれる。
p archers[-2] # こうするとロビンになるよ。
# 範囲外を参照するとnilが返るので気をつけましょう
p archers[4]
p archers[-5]

puts "=========="

# hash キーから呼び出すことができる配列の上位互換
# たとえば各ユニットがレア度いくつか？というハッシュがあるとすると、こんな感じ
archers_rarity = {
  "ナポレオン" => 5,
  "エミヤ" => 4,
  "ロビンフッド" => 3,
  "アーラシュ" => 1
}
# 呼び出し方はこちら
p archers_rarity
p "ナポレオンのレアリティは" + archers_rarity["ナポレオン"].to_s
p "#{archers.last}のレアリティは" + archers_rarity[archers.last].to_s
puts "=========="

# さらにハッシュのキーに対してハッシュを持つことができます
# たとえば各ユニットがレア度以外のハッシュを持つとすると、こんな感じ
# また :シンボル => 5 の矢印演算子を書くのが手間なので省略した書き方をしました
# (:シンボル => 5) = (シンボル: 5)
archers_hash = {
  napoleon: {
    rarity: 5,
    full_name: "ナポレオン＝ボナパルト",
    Quick: 1,
    Art: 2,
    Buster: 2,
    lethal_weapon: "アルク・ドゥ・トリオンフ・ドゥ・レトワール"
  },
  emiya: {
    rarity: 4,
    full_name: "閲覧権限がありません",
    Quick: 1,
    Art: 3,
    Buster: 1,
    lethal_weapon: "アンリミテッドブレイドワークス"
  },
  robin: {
    rarity: 3,
    full_name: "ロビンフッド",
    Quick: 2,
    Art: 2,
    Buster: 1,
    lethal_weapon: "イー・バウ"
  },
  Arash: {
    rarity: 1,
    full_name: "アーラシュ＝カマンガー",
    Quick: 1,
    Art: 2,
    Buster: 2,
    lethal_weapon: "ステラ"
  }
}

puts "ナポレオンのステータス："
p archers_hash[:napoleon] # 省略した書き方なので、呼び出し方は[:シンボル]となります
puts "アーラシュの宝具："
p archers_hash[:Arash][:lethal_weapon] # 階層深くまで行くならさらにシンボルを重ねます
