PRICE_COKE = 100
MONEYS = [1, 5, 10, 50, 100, 500, 1000, 2000, 5000, 10000]
VENDING_USABLE_MONEYS = [10, 50, 100, 500, 1000]

# そもそもお金ですか？どら焼きじゃないですか？
# という判断がしたかったのでここで切り分けました
def money? object
  Integer === object && MONEYS.include?(object)
end
# お金だけど、自動販売機が受け付けるお金ですか？
def usable_money? money
  VENDING_USABLE_MONEYS.include?(money)
end

# 金をうけつける細胞
# お金以外の物は確実に弾く
def receive_money object
  if money? object
    # お金でも[10, 50, 100, 500, 1000]以外は弾く
    unless usable_money? object
      puts "#{object}円は返すわ。"
    end
  else
    puts "お金を入れてね。"
  end
end

# insertで弾いてくれてるので確実に引数はお金です
# 飲み物排出細胞
def vend money
  if money >= PRICE_COKE
    change = money - PRICE_COKE
    puts "コカ・コーラ（#{PRICE_COKE}円）を買いました。"
    puts "おつりは#{change}円です。" if change > 0
  else
    puts "足りねーよ！#{money}円は返すわ。"
  end
end

# vendが受け付けるテスト例
vend 10
vend 50
vend 100
vend 500
vend 1000
# receive_moneyが受け付けるテスト例
receive_money 0
receive_money 1
receive_money 5
receive_money 2000
receive_money 5000
receive_money 3.14
receive_money 99
receive_money 120
receive_money "どら焼き"
receive_money "100"
