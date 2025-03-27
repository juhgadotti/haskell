somar :: Int -> Int -> Int
somar x y = x + y

saudacao :: String -> [Char]
saudacao nome = "Ola" ++ nome ++ ".Seja vem vind."

impares :: [Int] -> [Int]
impares xs = [x | x-<xs, odd x]
--tenho uma lista de int e vo querer outra lista de into
--uso a compreensao de lista com uma função q fiz
[odd x | x<-[1..30]]
--saida: lista boleana, como é para encontrar impares: true false true false true false

zip [odd x | x<-[1..10]] [1..10]
--possivel transformar de int pra boolean.