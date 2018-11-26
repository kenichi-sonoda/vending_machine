require 'yaml'
require './item'

items = YAML.load_file('./settings.yml')[:items]

items.each do |item_name, detail|
  item = Object.const_get(item_name)
  RSpec.describe "#{item}クラスの" do
    describe 'priceが' do
      it "#{detail[:price]}であること" do
        expect(item.price).to eq(detail[:price])
      end
    end

    describe 'nameが' do
      it "#{detail[:name]}であること" do
        expect(item.name).to eq(detail[:name])
      end
    end

    describe 'スーパークラスが' do
      it "Itemクラスであること" do
        expect(item.superclass).to eq(Item)
      end
    end
  end
end
