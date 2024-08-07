-- ☆ 関数定義と呼び出し
altSucc :: Int -> Int
altSucc x = x + 1 -- succを自作

altAdd :: Int -> Int -> Int
altAdd x y = x + y -- addを自作

-- ☆ 関数のパターンマッチ
hoge :: Int -> String
hoge 1 = "One"
hoge 2 = "Two"
hoge x = "foobar"
-- パターンマッチを使えばif文から解放されたりする
-- 引数ごとの判定は上から下に流れていくので、一番上に hoge x を置いちゃうとなんでもfoobarが返ってくるので注意
-- もし最後のxが定義されてないと、1か2以外の引数が与えられたときに例外を投げる

-- ☆ タプルのパターンマッチ
addvec :: (Int, Int) -> (Int, Int) -> (Int, Int)
addvec (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
-- こんな風にすれば2つのベクトルの和が計算できる
-- それでは任意のタプルを1つ引数に取ってその絶対値を計算してみよう
calcabsolute :: Floating a => (a, a) -> a -- 小数点以下が多すぎてDoubleでも計算し切れんのでFloat型クラスのインスタンスとする
calcabsolute (x, y) = (x ^ 2 + y ^ 2) ** (1 / 2) --整数のべき乗は^と**が使える反面、浮動小数のべき乗は**

-- ☆ リストのパターンマッチ
althead :: [a] -> a
althead [] = error "empty!"
althead (x:_) = x -- リストの残りの部分を無視するときなんかにx:_を使う
-- 空の場合はエラーメッセージを文字列で返すのではなく、error関数で例外を投げる
-- もし戻り値が文字列だと、例えば数値のリストが入ってきた時に戻り値の型が統一されない

howlong :: [a] -> String
howlong [] = "empty!"
howlong (x:[]) = "one"
howlong (x:y:[]) = "two"
howlong (x:y:_) = "over three"
-- 引数のリストは、x:[]記法でも表現できる

split :: (Show a) => [a] -> String
split [] = "empty!"
split (x:xs) = "first: " ++ show x ++ ",last: " ++ show xs
-- x:xsって書くと引数の先頭をxに束縛し、それ以降をxsに束縛する

-- ☆ リストのasパターン
getall　:: (Show a) => [a] -> String
getall [] = "empty!"
getall all@(x:xs) = "first: " ++ show x ++ ",last: " ++ show xs ++ ",all: " ++ show all
-- ラベル名@(パターン) って書くとパターンに引っかかった全体が束縛される asパターンって呼ぶらしい


main :: IO ()
main = do
    putStrLn(show (altSucc 2))
    putStrLn(show (altAdd 2 3))
    putStrLn(show (2 `altAdd` 3)) -- ``でくくって中置で呼び出すことも可
    putStrLn(show (hoge 1))
    putStrLn(show (addvec (1, 2) (3, 4)))
    putStrLn(show (calcabsolute (1, 2)))
    putStrLn(show (althead "hogehoge"))
    putStrLn(show (howlong [1]))
    putStrLn(show (split [1, 2, 3]))
    putStrLn(show (getall [1, 2, 3]))

    -- ☆ リスト内包表記のパターンマッチ
    let hogelist = [(1,2), (3,4), (5,6)]
    putStrLn(show ([a + b | (a, b) <- hogelist]))
    -- お馴染みの内包表記、|の右側でリストの各要素をそれをラベルに束縛し、|の左側でリストにして出力
    -- リスト内包表記のパターンマッチを試してみよう
    putStrLn(show ([3 + b | (3, b) <- hogelist]))
    -- 見事に(3,4)だけ対象になった パターンマッチに引っかからなければ出力のリストには含まれない
