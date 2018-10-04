price = 150

# rubyでif elseは以下のとおりです
if price >= 100
  puts "これが表示されます"
elsif price >= 50
  puts "もちろん表示されません"
else
  puts "ちなみにif文の（）も要りません"
end

# 一行でまとめることもできます
# ただし条件が長くなりすぎると可読性悪いので注意です
puts "これは後置ifと言われます。" if price >= 100

# 三項演算子も使えます
# 条件 : trueの場合の処理 ? falseの場合の処理
price >= 100 : "前にtrueの場合の結果" ? "後ろにfalseの場合の結果"
