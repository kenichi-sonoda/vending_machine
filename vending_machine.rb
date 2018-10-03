PRICE_COKE = 100

# 金をうけつける細胞
# お金以外の物は確実に弾く
# お金でも[10, 50, 100, 500, 1000]以外は弾く
def receiveMoney object
  usable_money = [10, 50, 100, 500, 1000]
  # お金以外のものがきたら弾くよ
  if usable_money.include?(money)
  end
  if is_money? money
    if money == 0
      puts "お金は入れようね"
    else
      puts "#{money}円は返すわ。"
    end
  else
    puts "どら焼きは返すわ。"
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

def is_money? object
  Integer === object
end

# vendが受け付けるテスト例
vend 10
vend 50
vend 100
vend 500
vend 1000
# receiveMoneyが受け付けるテスト例
# receiveMoney 0
# receiveMoney 1
# receiveMoney 5
# receiveMoney 2000
# receiveMoney 5000
# receiveMoney 3.14
# receiveMoney 99
# receiveMoney 120
# receiveMoney "どら焼き"
# receiveMoney "100"
