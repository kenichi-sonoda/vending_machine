# rubyでは複数のデータを扱う場合、配列(array)と連想配列(hash)を利用します。

# array 要素を複数個格納できるクラス
# 宣言
p archers = ["ナポレオン", "イシュタル", "ギルガメッシュ"]
# 要素の追加・削除
p archers.push("オリオン") # 要素追加はpushだったり、
p archers << "新宿のアーチャー" # 色々追加方法があります。
p archers.delete_at(archers.length - 1) # 削除も色々あります。一番最後の要素を削除しときましょう。
p archers

# 先頭の参照
p archers[0] # 配列に添え字で呼び出せるし、
p archers.first # 一番最初を呼び出すメソッドも用意されてる。
# 末尾の参照
p archers[3] # 配列の末尾要素を選択するには直接添字もいいけど、
p archers[archers.length - 1] # 要素数から-1を引いたり、
p archers.last # 一番最後をメソッドも用意されてるし、
p archers[-1] # そもそも-1で末尾から参照していってくれる
p archers[-2] # こうするとギルガメッシュになるよ
# 範囲外を参照するとnilが返るので気をつけましょう
p archers[4]
p archers[-5]

# hash
