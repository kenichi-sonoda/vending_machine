def buy money
  if money == 100
    puts money.to_s + "円でコカ・コーラ"
  else
    puts "買えねーよ！"
  end
end

buy 100
buy 120
buy "どら焼き"
buy "100"
