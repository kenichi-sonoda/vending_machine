require 'yaml'

# 通貨クラス
class Money end

MONEY_KINDS = YAML.load_file('./settings.yml')[:money_kinds]

class Yen < Money

  YEN_KINDS = MONEY_KINDS[:yen_kinds]

  def initialize(value)
    yen = YEN_KINDS.find{ |yen_kind| yen_kind[:value] == value }
    raise "#{value}は存在しない値です" if yen.nil?

    @value = yen[:value]
    @type = yen[:type]
  end

  attr_reader :value, :type
end
