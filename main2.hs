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

pmLista (x:z:y:xs) = somarUm x

somarUm :: Int -> Int
somarUm x = x + 1

--tipos de dados algebricos

data Binario = Zero | Um deriving Show

binarioParaInt :: Binario -> Int
binarioParaInt Um = 1
binarioParaInt Zero = 0

intParaBinario :: Int -> Binario
intParaBinario 0 = Zero
intParaBinario 1 = Um



{-
public class Binario{}
public class Zero extends Binario{}
-}

--Record Syntax
data Pessoa = Fisica{nome::String, cpf::String} | Juridica{nome::String, cnpj::String} deriving Show




{-
data Pessoa = Fisica String Int | Juridica String Int deriving Show

getNome :: Pessoa -> String
getNome (Fisica nome cpf) = nome
getNome (Juridica nome cnpj) = nome


setNome :: Pessoa -> String -> Pessoa
setNome (Fisica nome cpf) novoNome = 
    Fisica novoNome cpf
-}