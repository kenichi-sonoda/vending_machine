require 'yaml'
require './money'

puts %x{ pwd }
yen_kinds = YAML.load_file('./settings.yml')[:money_kinds][:yen_kinds]

RSpec.describe "Yenクラスの" do
  describe 'インスタンス生成時に' do
    yen_kinds.each do |yen_kind|
      context "正当な値 #{yen_kind[:value]} を渡したとき" do
        it "正しくインスタンスが生成されること" do
          yen = Yen.new(yen_kind[:value])
          # Yenクラスのインスタンスが生成されること
          expect(yen.class).to eq(Yen)

          # 正しいvalueが設定されること
          expect(yen.value).to eq(yen_kind[:value])

          # 正しいtypeが設定されること
          expect(yen.type).to eq(yen_kind[:type])
        end
      end
    end

    [111, '100', :aaa].each do |value|
      context "不正な値 #{value} を渡したとき" do
        it "エラーが返ること: '#{value}は存在しない値です'" do
          expect { Yen.new(value) }.to raise_error(RuntimeError, "#{value}は存在しない値です")
        end
      end
    end
  end

  describe '' do
  end
end
