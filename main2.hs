-- Pattern Matching | Combinacao de padrao

numerosExtenso :: Int -> String
numerosExtenso 1 = "Um"
numerosExtenso 2 = "Dois"
numerosExtenso x = "?"

saudar :: String -> String
saudar "Neymar" = "Seja bem vindo Neymar"
saudar "Fulano" = "Seja bem vinda Fulano"
saudar nome = "Seja bem vindo: " ++ nome

pmTupla :: (Int,Int) -> Int
pmTupla(1,1) = 2
pmTupla(x,1) = 1
pmTupla(1,x) = x
pmTupla(321,4) = 326
pmTupla (x,y) = x + y


--pattern matching de lista
pmLista :: [Int] -> Int
pmLista [] = 0
pmLista [x] = x
pmLista [x, y] = y
pmLista [z, y, x] = z

pmLista()

somarUm :: Int -> Int
somarUm x = x + 1