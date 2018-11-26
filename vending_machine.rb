# Let's enjoy (Mob) programming!!
puts 'コーラ: 100円, ジンジャーエール :160円'
puts '※ジンジャーエールは　160円ぴったり入れてください'
puts 'お金を入れてください'
money = gets.to_i
puts "投入金額 #{money} 円"
if money == 100
  puts 'コーラ'
elsif money ==160
  puts 'ジンジャーエール'
elsif money > 100
  puts 'コーラ'
  puts "お釣り #{money - 100} 円"
else
  puts 'お金が足りませんでした'
end
