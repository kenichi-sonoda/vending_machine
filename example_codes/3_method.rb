# rubyでメソッドを定義する場合は以下の通りです
# # def 変数名 引数名（スペースを置いて複数可。引数の省略も可。）
# #   処理内容
# # end

# 英霊召喚します（弓ピックアップ）
def summon_archer
  random = Random.new
  # 指定範囲内の整数をランダムで返すメソッド
  lottery_number = random.rand(1..100)

  if lottery_number == 1
    puts "☆５：" + ["ナポレオン", "イシュタル", "ギルガメッシュ"].sample + "召喚"
  elsif lottery_number <= 3
    puts "☆４：" + ["エミヤ", "織田信長" , "インフェルノ"].sample + "召喚"
  elsif lottery_number <= 40
    puts "☆３：" + ["ロビンフッド", "エウリュアレ" , "ビリー"].sample + "召喚"
  else
    puts "概念抽出"
  end
end

puts "弓ピックアップを10連します。"
# せっかくなので10連させます
10.times do |index|
  puts "#{index + 1}回目"
  # 定義したメソッドを呼び出す
  summon_archer
end
