--基礎文法
main :: IO ()
main = do
　　-- ☆ 演算
    putStrLn (show (1 + 1))

    -- ☆ 論理ゲート
    putStrLn (show (True && False))
    putStrLn (show (True || False))

    -- ☆ 等価演算
    putStrLn (show (1 == 1))
    putStrLn (show (1 /= 1)) -- 他言語の!=に相当

    -- ☆ 束縛
    let x = 1  -- メモリの値をラベルに束縛する
    -- 再代入 let x = x + 1 みたいなことはできない　（遅延評価ゆえに）定義はできるけど呼び出すと無限再帰により壊れる
    let x = 2  -- 再代入はできないが、別スコープのラベルに再度束縛することでそれを叶える
    putStrLn (show x)

    -- ☆ リスト
    let intlist = [1, 2, 3]
    putStrLn　(show (0 : intlist))        -- 値やラベル名 : リスト で先頭に追加
    -- 勿論 let intlist = 0 : intlist みたいな再代入はできない
    putStrLn　(show (elem 1 intlist))     -- elemは存在の是非を問う
    putStrLn　(show (200 `elem` intlist)) -- 中置で呼び出す方が見やすいですね...
    let charlist = "hogehoge"　　　　　　　-- 文字列はcharの配列 これはC系と同じだね
    putStrLn charlist
    let hoge = 1:[]                     -- 1:[] は[1]のシンタックスシュガーだし1:2:3:[]は[1, 2, 3]と同じ 
    putStrLn (show hoge)

    -- ☆ リストのレンジ
    putStrLn (show [1..20])
    putStrLn (show [3, 6..20]) -- 最初の要素,二つ目の要素..上限 でステップ（二つ目と最初の差）を指定
    -- もし[3, 6..] みたいに上限を指定しないと3刻みで無限に増え続ける
    -- が、遅延評価なので無限リストも使う分だけ取り出せばへっちゃら
    let inflist = [3, 6..]
    putStrLn (show (inflist !! 0)) -- 他言語の inflist[0]に相当

    -- ☆ 内包表記
    let intlist = [x * 2 | x <- [1..10]]
    putStrLn (show intlist)
    -- 1～10の各要素を2倍したリストを取得
    -- | の右側にリストを定義し、それをラベルxに束縛する
    -- | の左側にはそれをどのように出力したいか記述
    -- 遅延評価だから当然無限リストだってできるよ
    putStrLn (show　([x * 2 | x <- [1..]] !! 0))
    -- 束縛条件を充実させれば、「1～10の範囲で、2倍したら10以上の数だけ抽出」みたいなことも表現できる
    putStrLn (show　([x | x <- [1..10] , x * 2 > 10]))

    -- ☆ 条件分岐
    let x = 1
    let testlist = [2, 5..30]
    if 1 `elem` testlist
        then putStrLn "あるよ"
        else putStrLn "ないよ"-- if文はelseが必須

    -- ☆ タプル
    -- タプルはリストと違って要素の型を問わない
    let tp = (1, "hoge")
    putStrLn (show tp)
    -- 余談だけど2要素タプルをペア、3要素だとトリプルって呼ぶらしいね
    -- タプルの要素数は型みたいなもん　リストの要素の型が違うとダメなように、リストの要素のタプルの長さが違うのはダメ
    putStrLn (show [(1, 2), (3, 4), (5, 6)]) -- 許容
    -- putStrLn (show [(0, 1, 2), (3, 4), (5, 6)]) はNG

    -- ☆ リストをタプルにしてみよう
    -- zip関数は2つのリストを引数にとって、同じインデックスの要素を組み合わせたタプルを返す
    putStrLn (show (zip [1, 2] [3, 4]))
    -- 当然中置でも可能
    putStrLn (show ([1, 2] `zip` [3, 4]))
    -- 戻り値がタプルだからリストの型は関係ない
    putStrLn (show (zip [1, 2] ["a", "b"]))
    -- リスト長さが違っても遅延評価だから必要なだけ返す
    putStrLn (show (zip [1..] ["a", "b"]))

    --　☆ リスト内包表記とタプル
    let tp = [ (x, y) | x <- [1..3], y <- [4..6]]
    -- リストの要素を束縛し、タプルとして出力もできる
    putStrLn (show tp)
