require './ic_card'

RSpec.describe "Suicaクラスの" do
  describe '残高が500のインスタンスに対して' do  
    before do
      @suica = Suica.new(500)
    end

    describe 'chargeメソッドに'  do
      context '300を渡すと' do
        before do
          @suica.charge 300
        end

        it '残高に加算されていること' do
          expect(@suica.balance).to eq(800)
        end
      end

      {
        '負の値'=> -100,
        '実数'=> 0.1,
        '文字列'=>'hoge'
      }.each do |test_case, value|
        context "#{test_case}である #{value} を渡すと" do
          before do
            @suica.charge value
          end

          it '残高が変わらないこと' do
            expect(@suica.balance).to eq(500)
          end
        end
      end
    end

    describe 'payメソッドに'  do
      context '300を渡すと' do
        before do
          @suica.pay 300
        end

        it '残高が減算されていること' do
          expect(@suica.balance).to eq(200)
        end
      end

      {
        '負の値'=> -100,
        '実数'=> 0.1,
        '文字列'=>'hoge'
      }.each do |test_case, value|
        context "#{test_case}である #{value} を渡すと" do
          before do
            @suica.pay value
          end

          it '残高が変わらないこと' do
            expect(@suica.balance).to eq(500)
          end
        end
      end
    end
  end
end
