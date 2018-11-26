require 'yaml'
require './vending_machine'
require './item'
require './money'

items = YAML.load_file('./settings.yml')[:items]

RSpec.describe "VendingMachineクラスの" do
  before do
    @vending_machine = VendingMachine.new
  end

  describe 'add_itemメソッドに' do
    items.each_key do |item_name|
      item = Object.const_get(item_name)

      context "#{item}クラスのインスタンスを渡すと" do
        before do
          @item = item.new
          @vending_machine.add_item @item
        end

        it "ストック追加されること" do
          expect(@vending_machine.stocks[item]).to eq([@item])
        end
      end
    end

    context "不正なクラスを渡すと" do
      before do
        item = Array.new
        @vending_machine.add_item item
      end

      it "ストックに追加されないこと" do
        expect(@vending_machine.stocks).to be_empty
      end
    end
  end

  describe 'receive_moneyメソッドに' do
    [10, 50, 100, 500, 1000].each do |allowed_value|
      context "使えるお金(#{allowed_value}円)を渡すと" do
        before do
          @yen = Yen.new(allowed_value)
          @vending_machine.receive_money @yen
        end

        it "投入金に追加されること" do
          expect(@vending_machine.deposits.first).to eq(@yen)
        end
      end
    end

    context "Yen以外のクラスを渡すと" do
      before do
        @dummy = Array.new
      end

      it "そのまま返されること" do
        expect(@vending_machine.receive_money @dummy).to eq(@dummy)
      end
    end

    [1, 5, 2000, 5000, 10000].each do |prohibit_value|
      context "使えないお金(#{prohibit_value}円)を渡すと" do
        before do
          @yen = Yen.new(prohibit_value)
          @vending_machine.receive_money @yen
        end

        it "返却口に返されること" do
          expect(@vending_machine.returns.first).to eq(@yen)
        end
      end
    end
  end

  describe 'pull_return_leverメソッドを実行すると' do
    before do
      # 100円玉x1, 50円玉x1を投入する
      @moneys = [100, 50].map { |value| Yen.new(value) }
      @moneys.each { |money| @vending_machine.receive_money money }
      
      # 返却レバーを押す
      @vending_machine.pull_return_lever
    end

    it "すべての投入金が返却口に返されること" do
      expect(@vending_machine.returns).to eq(@moneys)
    end
  end

  describe 'select_itemメソッドで' do
    context "ストックに#{items.each_key.map{ |item_name| "#{Object.const_get(item_name).name}(#{Object.const_get(item_name).price}円)" }.join(', ')}が一つずつあるとき" do
      before do
        # ストックに商品を一つずつ追加する
        items.each_key do |item_name|
          @vending_machine.add_item Object.const_get(item_name).new
        end
      end

      context '120円(100円x1, 10円x2)を投入して' do
        before do
          # 100円玉x1, 10円玉x2を投入する
          [100, 10, 10].each do |value|
            @vending_machine.receive_money Yen.new(value)
          end
        end

        items.each_key do |item_name|
          item = Object.const_get(item_name)
          if item.price <= 120
            context "購入可能な#{item.name}(#{item.price}円)を選択すると" do
              before do
                # 商品を選択する
                @item = @vending_machine.select_item item
              end

              it "#{item.name}が受け取れること" do
                expect(@item.kind_of?(item)).to be_truthy
              end

              it "清算後の投入金額の合計が#{120 - item.price}円であること" do
                expect(@vending_machine.sum_deposits).to eq(120 - item.price)
              end

              it "#{item.name}のストックが減ること" do
                expect(@vending_machine.stocks[item]).to be_empty
              end
            end
          else
            context "金額不足で購入不可能な#{Object.const_get(item_name).name}(#{item.price}円)を選択すると" do
              before do
                # 商品を選択する
                @item = @vending_machine.select_item Object.const_get(item_name)
              end
            
              it "何も返されないこと" do
                expect(@item).to be_nil
              end
            end
          end
        end

        context 'ラインナップに存在しない商品を選択すると' do
          before do
            # 存在しない商品を選択する
            @item = @vending_machine.select_item Array
          end

          it "何も返されないこと" do
            expect(@item).to be_nil
          end
        end
      end

      context '1000円を投入して' do
        before do
          @vending_machine.receive_money Yen.new(1000)
        end

        context '在庫切れの商品を選択すると' do
          item = Object.const_get(items.keys.first)
          before do
            # 1度商品を購入して在庫を空にする
            @vending_machine.select_item item
          end

          it "何も返されないこと" do
            expect(@item).to be_nil
          end
        end
      end
    end
  end
end
