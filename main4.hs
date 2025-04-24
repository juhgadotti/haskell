-- polimorfismo parametrico / tipos com parametros

data Caixa a = UmaCaixa a deriving Show

data Produto = Produto String Int deriving Show

{-
List<Pessoa> pessoas = new ArrayList<>();

lista = kind2 -> o <T> é o que define o kind

o a do haskel é o T, assumindo qualquer forma que passas
ex: UmaCaixa 10, UmaCaixa "Oi", UmaCaixa true

não podem ser tipos diferentes se for 2 seguidos, mas pode ser "a b" -> isso é kind 3
map é kind 3 -> array, chave e value

etruturas de kind 2 sao estruturas generalistas, para generalizar comportamentos de um codigo e evitar 
lista é uma estrutura q carrega e opera valores, nao importando para o primeiro kind

possivel criar tipos recursivos

-}

data Caixa2 a b = UmaCaixa2 a | DuasCaixas a b deriving Show

--data List a = a :>: List a deriving Show
data Lista a = Elemento a (Lista a) deriving Show

{-isso ai é operador em ordem, ou infixo
bom pra listas
operadores especiais tem que estar entre ::

ordem vs preordem

data List a = a :>: List a deriving Show
isso aqui é um caso recursivo infinito sem parada
data List a = a :>: List a | Phodace (caso base) deriving Show
pode ser Null, ou fim
 -}
data List a = a :>: List a | Nulo --deriving Show
lista = 1 :>: (2 :>: (3 :>: Nulo ))

verificaElemento ::(Eq a) => a -> List a -> Bool
verificaElemento _ Nulo = False

verificaElemento elemento (x :>: resto)
 | elemento == x = True
 | otherwise = verificaElemento elemento resto   

data Produto2 = Produto2 String Int deriving (Show,Eq)

{-
eq é um type class pra comparar o tipo, na func é pra garantir q o parametro a só recebam tipos
q se comportem como EQ
   todo a contido dentro de EQ é comparavel, == é uma função q 
   pertence a EQ (como - + sao do num), e de igualdade é de bool

   verificaElemento 2 lista
-}

converterStringList :: (Show a) => List a -> String
converterStringList (x :>: Nulo) = show x ++ "]"
converterStringList (x :>: rest) = show x ++ "," ++ converterStringList rest

--  converterStringList lista  retorna "1,2,3]"

converterListaF :: (Show a) => List a -> String
converterListaF lista = "[" ++ converterListaF lista

--tipo arvore recursivo
-- Tree a = Branch (Tree a) (Tree a) | Leaf a | Nulo

--removerElemento elemento (x :>: (y :>: resto))
-- | elemento == y = x :>: resto

--typeclass - classes de tipos
--isso aq eh um typeclass

class SimNao a where
    simnao :: a -> Bool

    {-
    public interface SimNao<A>{
    public abstract Bool simnao(A a)}

    ensina o metodo abstrato a se comportar
    -}

instance SimNao Int where
    simnao x 
        | x < 18 = False
        | otherwise = True

instance SimNao [a] where
    simnao [] = False
    simnao _ = True

instance SimNao Produto where
    simnao (Produto "" 0) = False
    simnao _ = True

class Mostrar a where
    mostrar :: a -> String

instance Mostrar Produto where
    mostrar (Produto nome preco) = "Produto{"++nome++ ","++show preco++"}"

instance (Show a) => Show (List a) where 
    show Nulo = "]"
    show (x :>: resto) = show x ++ "|" ++ show resto


--whitepaper sacamoto