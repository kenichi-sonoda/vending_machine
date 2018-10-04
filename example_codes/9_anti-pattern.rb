def judge moneys
  if moneys[:1_yen] > 0
    if moneys[:5_yen] > 0
      if moneys[:10_yen] > 0
        if moneys[:50_yen] > 0
          if moneys[:100_yen] > 0
            if moneys[:500_yen] > 0
              # 正常系用のとても長い処理
            end
          end
        end
      end
    end
  end
end

moneys = {
  1_yen: 0,
  5_yen: 0,
  10_yen: 2,
  50_yen: 0,
  100_yen: 1,
  500_yen: 0
}
judge moneys
