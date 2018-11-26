require 'yaml'
items = YAML.load_file('./settings.yml')[:items]

# 商品クラス
class Item
end

# それぞれの飲み物クラス
items.each do |name, detail|
  eval <<~EOS
    class #{name} < Item
      @price = #{detail[:price]}
      @name = '#{detail[:name]}'

      def self.price; @price; end
      def self.name; @name; end
    end
  EOS
end
