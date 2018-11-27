require_relative './money.rb'
require_relative './ic_card.rb'
require_relative './item.rb'
require_relative './vending_machine.rb'

#######################################
# 前準備
LINEUPS = [Water, Coke, Coffee, GreenTea] # 商品一覧
INIT_NUM_OF_STOCKS = 1 # 在庫数初期値

# 自動販売機をつくる
vending_machine = VendingMachine.new(debug=true)

# 商品をストックする
LINEUPS.each do |item|
  # それぞれ初期値の個数ずつ在庫に追加する
  INIT_NUM_OF_STOCKS.times { |idx| vending_machine.add_item item.new }
end
# ストック一覧を表示
puts '[before]'
puts vending_machine.show_stocks
puts

#######################################
# 処理開始
TEST_CASE = 5
case TEST_CASE
when 0
  puts "Scenario: 150円を投入して120円の商品を購入する"
  puts '- 150円投入(100円x1, 50円x1)'
  vending_machine.receive_money Yen.new(100)
  vending_machine.receive_money Yen.new(50)

  puts '- コーヒー(120円)を選択'
  item = vending_machine.select_item Coffee

  puts "- 購入: #{item}"
  puts "- 在庫: #{vending_machine.stocks}"
  puts "- おつり: #{vending_machine.returns}"

when 1
  puts "Scenario: 500円を投入して返却レバーを引く"
  puts '- 500円投入'
  vending_machine.receive_money Yen.new(500)

  puts "- 返却レバーを引く"
  vending_machine.pull_return_lever
  # 返却金額
  puts "- おつり: #{vending_machine.returns}"

when 2
  puts "Scenario: 50円を投入して120円の商品を購入する"
  puts '- 100円投入'
  vending_machine.receive_money Yen.new(100)

  
  puts '- コーヒー(120円)を選択'
  item = vending_machine.select_item Coffee

  puts "- 購入: #{item}"
  puts "- 在庫: #{vending_machine.stocks}"
  puts "- おつり: #{vending_machine.returns}"

when 3
  puts "Scenario: 200円を投入して100円の商品と120円の商品を購入する(投入金額不足)"
  puts '- 200円(100円x2)投入'
  2.times { vending_machine.receive_money Yen.new(100) }

  puts "- コーヒー(120円)を選択"
  item = vending_machine.select_item Coffee

  puts "- 購入: #{item}"
  puts "- 在庫: #{vending_machine.stocks}"
  puts "- おつり: #{vending_machine.returns}"

  puts "- 水(100円)を選択"
  item = vending_machine.select_item Water

  puts "- 購入: #{item}"
  puts "- 在庫: #{vending_machine.stocks}"
  puts "- おつり: #{vending_machine.returns}"

when 4
  puts "Scenario: ICカード支払い"
  suica = Suica.new
  suica.charge 1000 # 1000円チャージ
  puts "- カード残高: #{suica.balance}"

  puts "- コーヒー(120円)を選択"
  item = vending_machine.select_item Coffee
  puts "- itemはnilのはず: #{item}"

  # Suicaでタッチする
  item = vending_machine.touch suica

  puts "- 購入: #{item}"
  puts "- 在庫: #{vending_machine.stocks}"
  puts "- カード残高: #{suica.balance}"
when 5
  puts "Scenario: ICカード支払い(残高たりない)"
  suica = Suica.new
  suica.charge 100 # 1000円チャージ
  puts "- カード残高: #{suica.balance}"

  puts "- コーヒー(120円)を選択"
  item = vending_machine.select_item Coffee
  puts "- itemはnilのはず: #{item}"

  # Suicaでタッチする
  item = vending_machine.touch suica

  puts "- 購入: #{item}"
  puts "- 在庫: #{vending_machine.stocks}"
  puts "- カード残高: #{suica.balance}"
end

puts
puts '[after]'
puts vending_machine.show_stocks
