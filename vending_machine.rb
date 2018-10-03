PRICE_COKE = 100

# 金をうけつける細胞
def receiveMoney object
  # お金以外のものがきたら弾くよ
end

# insertで弾いてくれてるので確実に引数はお金です
# 飲み物排出細胞
def buy money
  usable_money = [10, 50, 100, 500, 1000]
  if usable_money.include?(money)
    if money >= PRICE_COKE
      change = money - PRICE_COKE
      puts money.to_s + "円でコカ・コーラ"
      puts "おつりは#{change}円ですよ" if change > 0
    else
      puts "足りねーよ！"
    end
  else
    print "買えねーよ！"
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
end

def is_money? object
  Integer === object
end

# buyが受け付けるテスト例
buy 10
buy 50
buy 100
buy 500
buy 1000
# receiveMoneyが受け付けるテスト例
buy 0
buy 1
buy 5
buy 2000
buy 5000
buy 3.14
buy 99
buy 120
buy "どら焼き"
buy "100"
