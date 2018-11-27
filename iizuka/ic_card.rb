# ICカードクラス
class IcCard
  attr_reader :balance

  def initialize(balance=0)
    @balance = balance # 残高
  end

  # チャージ
  def charge value
    # valueが自然数なら、残高に加算する
    if value.kind_of?(Integer) && value.positive?
      @balance += value
    end
  end

  # 支払い
  # 残高が足りているかは、読み取った側が制御する
  def pay value
    # valueが自然数なら、残高から減算する
    if value.kind_of?(Integer) && value.positive?
      # 0円以下にはならない
      @balance = [@balance - value, 0].max
    end
  end
end

# Suica
class Suica < IcCard
end
