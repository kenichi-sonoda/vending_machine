# Let's enjoy (Mob) programming!!
@juice_list = {cola: {price: 100, stock: 0}, milk: {price: 100, stock: 3}, water: {price: 100, stock: 3}}

def buy(juice_name, money)
  if @juice_list.has_key?(juice_name) && @juice_list[juice_name][:stock] > 0 && money >= @juice_list[juice_name][:price]
    puts juice_name
    @juice_list[juice_name][:stock] -= 1
  elsif money < @juice_list[juice_name][:price]
    puts 'お金が足りません'
  elsif !@juice_list.has_key?(juice_name)
    puts '取り扱いがございません'
  else
    puts '売り切れです'
  end
end

def show_juice_list
  puts  @juice_list
end

show_juice_list
puts "お金を入れてください"
money = gets.chomp.to_i

puts "何を買いますか？"

juice = gets.chomp.to_sym

buy(juice, money)
