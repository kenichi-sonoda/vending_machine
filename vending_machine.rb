# Let's enjoy (Mob) programming!!
puts 'お金を入れてください'
money=gets.to_i
puts money
if money == 100
  puts 'coke'
elsif money > 100
  puts 'coke'
  puts money - 100
else
  puts 'お金が足りませんでした'
end
