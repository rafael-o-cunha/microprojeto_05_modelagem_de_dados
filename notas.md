## ***Um Aviso Importante***

> O Código apresentado aqui está longe de ser perfeito. Meu foco será exclusivamente na prática de criação de um modelo de dados, que é o tema central deste projeto. Então, caro programador experiente que está lendo isso, peço que não se preocupe demais com outras questões como arquitetura ou modelagem profunda ou boas práticas. foco no essencial!


## Objetivo
Meu ojetivo com este microprojeto é praticar modelagem de dados a partir de um problema muito comum em entrevistas técnicas, além disso como programador passo a maior parte do tempo consumindo modelos do que criando, então é sempre bom praticar.
Como eu pratico autoeducação, então todos passos, estruturas, ideias de projetos são minhas e por isso pode ocorre de eu não seguir o que é trivial do mercado ou considerado boas ou melhores práticas de mercado...

## Ferramentas
Utilizarei ferramentas que me permitirão implementar a modelagem além de testá-la:
- DrawDB  - para criação dos diagramas [1]
- PostgreDB  - para implementação e teste do modelo [2]
- DBeaver  - SGBD para visualizar, interagir e testar o modelo [3]
- VsCode - editor(nem vou anotar ou deixa ref rs) que usarei neste projeto para facilitar anotações, criação e uso do ambiente.


## Passos que segui para realizar o microprojeto
- levantamento de requisitos
- regras de negócio
- glossário
- entidades
- atributos
- relacionamentos
- cardinalidades
- normalização
- DER
- dicionário de dados
- SQL ANSI
- adaptação para PostgreSQL
- conjunto de perguntas para validar o modelo

---


## levantamento de requisitos
Em projetos reais, um analista normalmente conduz entrevistas usando perguntas abertas antes de entrar em detalhes técnicos.
*por ser um microprojeto pessoal precisarei simular a jornada de levantamento de requisitos e alguns aspectos que constróem o cenário do projeto, neste caso cai bem o uso de IA para apoiar o processo.

o objetivo passar por:
- entender o negócio
    Geralmente é uma reunião de negócios onde perguntas chave são realizadas para a descoberta do contexto em que a solução será elaborada.
    - Qual Objetivo do sistema?
    - Quem utilizará o sistema?
    - Como funciona o processo atualmente?
    - Quais são os principais problemas do processo atual?
    - O que vocês esperam melhorar?

- descobrir os processos
    Após entender o contexto é possível analisar em um nível mais detalhado e olhar os processos que estão envolvidos nele.
    - Como um livro chega à biblioteca?
    - Como um aluno pega um livro emprestado?
    - Comoo ocorre uma devolução?
    - Existe reserva?
    - Existe multa?
    - Existe limite de empréstimos?
    - Os professores também utilizam a biblioteca?
    - Os funcionários podem pegar livros?

- descobrir as informações
    após o entendimento dos processos envolvidos é possível aprofundar em mais um nível de detalhamento de forma a conhecer as informações necessárias para que os processos funcionem e que eventualmente podem compor o modelo.
    - Livro:
        - O que é registrado de um livro?
        - ISBN é obrigatório?
        - Editora é importante?
        - ano de publicação é importante?
        - etc.
    - Aluno:
        - O que identifica um aluno?
        - Utiliza-se matrícula? CPF?
        - Registra-se a Turma?
        - etc.
    - Empréstimo:
        - Quais datas precisam ser registradas?
        - Existe prazo de devolução?
        - É necessário guardar histórico?
        - etc.
    - etc.

- descobrir as regras
    As regras de negócio costumam aparecer naturalmente durante as conversas, por exemplo:
    - Cada aluno só pode pegar até três livros.
    - Cada livro possui várias cópias.
    - etc.

para esta etapa foi *gerado* um documento de levantamento de requisitos.
> levantamento_requisitos.md



## regras de negócio



## glossário



## entidades



## atributos



## relacionamentos



## cardinalidades



## normalização



## DER



## dicionário de dados



## SQL ANSI



## adaptação para PostgreSQL



## conjunto de perguntas para validar o modelo




---

## Bibliografia

[1] https://drawdb.vercel.app/

[2] https://www.postgresql.org/

[2.1] https://hub.docker.com/_/postgres

[2.2] https://renatogroffe.medium.com/postgresql-docker-compose-criando-rapidamente-ambientes-e-populando-bases-para-testes-6c4b9a4de313

[3] https://dbeaver.io/

[4] 