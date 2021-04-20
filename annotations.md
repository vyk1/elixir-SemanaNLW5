# About
## é compilado do erlang (que roda em uma VM chamada BEAM)
## é MVC
## MIX é o CLI (mix <cmds>)

``
// novo projeto phnx -> framework web em elixir (analogo a codeigniter)
mix phx.new inmana --no-html --no-webpack
``

``
//cria o banco
mix ecto.create
``

``
//roda
mix phx.server
``

mix.exs -> arquivo de configuração do projeto
->seção deps é de dependências
--> add credo

``
mix deps.get-> baixa deps
``

``
mix credo.gen.config -> gera .credo.exs (arquivo de configuração do credo)
``

``
mix compile
``

``
mix credo -> verifica se há algo de errado
``

``
mix format 
``

iex é o elixir interativo
>map = %{a:1, b:2}
 ou 
>map = %{"a"=>1, "b"=>2}

em vez de cao.latir(), tem-se Map.get(map, "a")

Se 
map["c"] //nill
então
Map.get(map, "c") //nill
porém
Map.get(map, "c", 5) //5 (como default)


## DIRETÓRIOS:

Lib (src) é onde o código fica

EX -> elixir script

EXS -> arquivo elixir

## POO X FP

Poo-> mapeamento de comportamentos do mundo real

FP -> composição de funções
Módulos são formas de agrupar as fx (dado-->[Modulo.funcao]--dado_modificado-->[Modulo.funcao2]--dado_modificado-->resultado)
* funções puras não tem efeitos colaterais (fx pequenas com propostos específicos)

# Rodando

iex -S mix // compila
>Inmana.Welcomer.welcome(%{"name"=> "J", "age"=> 15}) 

## dúvida? 
>h String.upcase

>[a,b,c] = [1,2,3] // ok
>[a] = [1,2,3] // erro
>%{age: x} = %{age: "12", color: "turquoise"} // age == "12" 
>%{time: x} = %{age: "12", color: "turquoise"} // erro

>alias InmanaWelcomer
>Welcomer.welcome(%{"name"=> "banana", "age"=> 42})

## tupla
{sucesso_ou_erro, resultado_da_operação} // facilita no fluxo de execução