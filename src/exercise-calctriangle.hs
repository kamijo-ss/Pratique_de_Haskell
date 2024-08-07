-- 例題：直角三角形を描く関数を作ろう　参考：すごいH本　↓条件
-- 2つの引数aとbを引数として受け付ける
-- 長さはすべてa以下の整数
-- 周囲の長さはb
-- リスト内包表記を使って、タプルを要素とするリストを出力する

-- ↓回答
-- 方針1：x,y,zの3つをA以下の整数に束縛する
-- 方針2: 束縛条件に xの2乗 + yの2乗 = zの2乗 とx + y + z = B を追加する
outTriangle :: Int -> Int -> [(Int, Int, Int)]
outTriangle a b = [(x, y, z) | 
                    x <- [1..a],
                    y <- [1..a],
                    z <- [1..a],
                    x^2 + y^2 == z^2,
                    x + y + z == b]
main :: IO ()
main = do
    putStrLn(show (outTriangle 10 24))