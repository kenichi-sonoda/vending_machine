PRICE_COKE = 100

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
    puts "買えねーよ！"
  end
end

buy 10
buy 50
buy 100
buy 500
buy 1000
buy 99
buy 120
buy "どら焼き"
buy "100"
