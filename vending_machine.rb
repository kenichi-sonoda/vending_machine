# Let's enjoy (Mob) programming!!
puts 'お金を入れてください'
money = gets.to_i
puts "投入金額 #{money} 円"
if money == 100
  puts 'coke'
elsif money > 100
  puts 'coke'
  puts "お釣り #{money - 100} 円"
else
  puts 'お金が足りませんでした'
end
