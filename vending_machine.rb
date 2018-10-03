def buy money
  usable_money = [100, 120]
  if usable_money.include?(money)
    puts money.to_s + "円でコカ・コーラ"
  else
    puts "買えねーよ！"
  end
end

buy 99
buy 100
buy 120
buy "どら焼き"
buy "100"
