class VendingMachine
  attr_accessor :returns
  attr_reader :stocks, :deposits

  # 投入可能な金額
  ALLOWD_MONEYS = [10, 50, 100, 500, 1000]
  

  def initialize(debug=false)
    @stocks = {}   # 商品の在庫
    @deposits = [] # 投入金
    @returns = []  # 返却金
    @change = 0    # おつり
    @debug = debug
  end

  # 商品を在庫に追加する
  def add_item item
    # 引数がItemクラスでなければ
    return nil unless (item.class.superclass == Item)

    # 未定義ならラインナップに追加
    @stocks[item.class] ||= []
    # 商品を在庫に追加
    @stocks[item.class] << item
  end

  # 投入されたお金の受け入れ
  def receive_money input
    # 日本円以外の異物は受けつけない
    unless input.kind_of?(Yen)
      debug_puts '(投入可能なお金は日本円のみです)' if @debug
      return input
    end

    yen = input

    # 投入金に追加
    if ALLOWD_MONEYS.include? yen.value
      @deposits << yen

    # 許可された種類のお金でなければ返却する
    else
      debug_puts '許可されていない金種です'
      @returns << yen
    end

    # 合計投入額を表示
    debug_puts show_sum_deposits
  end

  # 返却レバーを引く
  def pull_return_lever
    return_money # 当入金を返却する
  end

  # 商品を選択する
  def select_item key
    # 存在しないキーなら何もせずに終了
    if @stocks[key].nil?
      debug_puts "(存在しない商品です)"
      return nil
    end

    # 在庫がなければ何もせずに終了
    if @stocks[key].empty?
      debug_puts "(在庫切れです)"
      return nil
    end

    # 投入金額が不足していたら何もせずに終了
    if key.price > sum_deposits
      debug_puts "投入金額が足りません ( 値段: ¥#{key.price} / 投入金額: ¥#{sum_deposits} )"
      return nil
    end

    # 投入金額の精算
    pay(key.price)

    return @stocks[key].shift
  end

  # 商品在庫を出力する
  def show_stocks
    [
      '===================================',
      @stocks.map { |key, items| "#{key.name}(¥#{key.price}) x #{items.length}" }.join("\n"),
      '==================================='
    ].join("\n")
  end

  # 投入金額の合計値を計算する
  def sum_deposits
    @deposits.sum(0) { |deposit| deposit.value }
  end

  # 投入金額の合計を出力する
  def show_sum_deposits
    "合計投入額: ¥#{sum_deposits}"
  end

  #以下は内部メソッド
  private

  # @debugがtrueならメッセージを表示する
  def debug_puts msg
    puts msg if @debug
  end

  # 投入金を返却する
  def return_money
    @returns.concat(@deposits.shift(@deposits.length))
  end

  # 投入金額を清算する
  # おつりから@depositsを再構築
  def pay(price)
    change = sum_deposits - price
    @deposits = []

    # 投入可能な金額の高い方から順に引いていく
    ALLOWD_MONEYS.sort.reverse.each do |value|
      loop do
        # おつりの総額よりも金額が大きければスキップ
        break if value > change

        # おつりの総額から引いて、投入金に入れる
        change = change - value
        @deposits << Yen.new(value)
      end
    end
  end
end
