-- 例題：リスト内包表記と条件分岐を作ってfizzbazもどきの関数を作ろう　↓条件
-- 要素が整数のリストを引数として受け付ける
-- リストの各要素について、3で割れたら+1, 5で割れたら+2, 両方で割れたら+3,　どちらでもなければそのまま　のリストを出力する関数

-- ↓回答
-- 方針：「3と5の両方で割り切れる」ということは、「15で割り切れる」ことの必要十分条件
-- あとはそのまま条件を書き連ねるだけだね
fB :: [Int] -> [Int]
fB inputlist = [ if x `mod` 15 == 0 then x + 3
　　　　　　　　　else if x `mod` 3 == 0 then x + 1 
　　　　　　　　　else if x `mod` 5 == 0 then x + 2 
　　　　　　　　　else x | x <- inputlist]

main :: IO ()
main = do
    putStrLn(show (fB [1..30]))