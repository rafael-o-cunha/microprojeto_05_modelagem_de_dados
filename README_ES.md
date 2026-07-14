<p align="center">
  <h1>
    Microprojeto: Moelagem de dados (Biblioteca)
  </h1>
</p>

<div style="display: flex; align-items: center; padding: 10px;">
  <span>
    <a href="https://github.com/rafael-o-cunha/">
        <img src="https://img.shields.io/badge/-Home-black?style=for-the-badge" alt="Voltar ao Perfil">
    </a>
  </span>
</div>

---

<div style="display: flex; align-items: center; padding: 10px;">
  <span>
    <a href="https://github.com/rafael-o-cunha/microprojeto_05_modelagem_de_dados/blob/main/README.md">
      <img src="https://img.shields.io/badge/-Português-green?style=for-the-badge" alt="Português">
    </a>
  </span>
<span>
    <a href="https://github.com/rafael-o-cunha/microprojeto_05_modelagem_de_dados/blob/main/README_EN.md">
      <img src="https://img.shields.io/badge/-English-blue?style=for-the-badge" alt="English">
    </a>
  </span>
  <span>
    <a href="https://github.com/rafael-o-cunha/microprojeto_05_modelagem_de_dados/blob/main/README_ES.md">
      <img src="https://img.shields.io/badge/-Español-red?style=for-the-badge" alt="Español">
    </a>
  </span>
</div>

---

# 📋 Resumo

Este microprojeto foi desenvolvido com o objetivo de praticar todo o processo de modelagem de dados utilizado no desenvolvimento de sistemas.

Utilizando como domínio um **Sistema de Biblioteca Escolar**, o projeto percorre todas as etapas clássicas da engenharia de dados, desde o levantamento de requisitos até a implementação física do banco de dados em PostgreSQL.

Além da construção do modelo, o projeto também contempla sua validação através de operações SQL, consultas operacionais, consultas históricas, consultas gerenciais e um documento de evidências demonstrando que o modelo atende às necessidades do domínio.

Mais do que produzir um banco de dados funcional, este microprojeto foi concebido como um laboratório para compreender como um modelo de dados evolui durante o ciclo de desenvolvimento de software.

---

![DER Final](docs/image/notas/der_materializado.png)

---

> **⚠️ Nota sobre este microprojeto**
>
> Este projeto possui caráter exclusivamente educacional.
>
> O objetivo não foi apenas construir um banco de dados, mas exercitar todas as etapas envolvidas na modelagem de dados utilizadas em projetos reais.
>
> Para manter o foco no processo de modelagem, alguns temas como otimização de consultas, procedures, triggers, views materializadas e estratégias avançadas de desempenho foram propositalmente deixados para microprojetos futuros.
>
> Dessa forma, este projeto concentra-se em compreender profundamente como transformar requisitos de negócio em um modelo físico consistente e validado.
>
> Em outras palavras: **o objetivo aqui não é construir  o modelo de dados perfeito ou a base de dados perfeita, mas compreender profundamente os fundamentos da modelage de dados antes de evoluir para arquiteturas e recursos mais avançados.**

---

# Conceitos Praticados

## Levantamento de Requisitos

- Identificação do domínio
- Levantamento dos requisitos funcionais/não funcionais
- Identificação das entidades do negócio
- Levantamento das informações necessárias

## Regras de Negócio

- Formalização das regras do domínio
- Identificação das entidades impactadas
- Rastreabilidade entre regras e modelo

## Modelagem Conceitual

- Identificação de entidades
- Relacionamentos
- Cardinalidades
- Evolução do DER
- Resolução de relacionamentos N:N

## Modelagem Lógica

- Definição dos atributos
- Chaves primárias
- Chaves estrangeiras
- Entidades associativas
- Normalização

## Dicionário de Dados

- Documentação dos atributos
- Tipos de dados
- Restrições
- Valores padrão
- Regras relacionadas

## Modelo Físico

- Implementação em PostgreSQL
- Constraints
- Integridade referencial
- Índices
- Scripts

## Validação do Modelo

O modelo foi validado através de:

- Operações CRUD
- Consultas Operacionais
- Consultas Históricas
- Consultas Gerenciais
- Documento de Evidências

---

# Processo de Modelagem

O desenvolvimento seguiu o fluxo abaixo.

- Levantamento de requisitos
- Regras de negócio
- Entidades
- DER
- Dicionário de dados
- Conjunto de perguntas para validar o modelo
- SQL ANSI
- Documento de evidências

---

# Artefatos Produzidos

Ao longo do desenvolvimento foram produzidos os seguintes documentos.

- Levantamento de Requisitos
- Regras de Negócio
- Modelo Conceitual (DER)
- Modelo Lógico
- Dicionário de Dados
- Modelo Físico
- Scripts de Seed
- Operações SQL
- Consultas Operacionais
- Consultas Históricas
- Consultas Gerenciais
- Documento de Evidências

---

# Tecnologias

- PostgreSQL
- SQL ANSI
- Docker
- Docker Compose
- Makefile
- DBeaver
- Markdown

---

# 📂 Estrutura do Projeto

```text
.
├── docs
│   ├── 01-levantamento_requisitos.md
│   ├── 02-regras_negocio.md
│   ├── 03-dicionario_dados.md
│   ├── 04-validacao_modelo_dados.md
│   ├── 05-evidencias_validacao.md
│   └── image
├── infra
│   └── docker-compose.yml
├── sql
│   ├── 04-validacao_modelo_dados.sql
│   ├── 05-schema_db.sql
│   └── 06-seed_db.sql
└── Makefile
```

---

# Validação

O banco de dados foi validado através de quatro conjuntos de consultas.

| Grupo                  | Objetivo                                                    |
| ---------------------- | ----------------------------------------------------------- |
| Operações            | Validar inserções, alterações e processos do sistema    |
| Consultas Operacionais | Responder perguntas utilizadas no dia a dia da biblioteca   |
| Consultas Históricas  | Recuperar informações históricas preservadas pelo modelo |
| Consultas Gerenciais   | Produzir indicadores e apoiar a tomada de decisão          |

---

# Evidências

O projeto inclui um documento de evidências contendo a execução do modelo físico.

Foram documentadas evidências de:

- Criação do banco de dados
- Carga inicial (Seed)
- Execução das operações
- Consultas operacionais
- Consultas históricas
- Consultas gerenciais

---

# Conceitos Praticados

Durante este microprojeto foram praticados os seguintes conceitos.

- Levantamento de Requisitos
- Regras de Negócio
- Engenharia de Requisitos
- Modelagem Conceitual
- Modelo Entidade-Relacionamento (MER)
- Diagrama Entidade-Relacionamento (DER)
- Cardinalidades
- Entidades Associativas
- Normalização
- Modelo Lógico
- Modelo Físico
- Dicionário de Dados
- PostgreSQL
- SQL ANSI
- Chaves Primárias
- Chaves Estrangeiras
- Chaves Compostas
- Integridade Referencial
- Constraints
- Índices
- Scripts DDL
- Scripts DML
- Seed Database
- Consultas SQL
- Governança de Dados
- Documentação Técnica
- Entre outros...

---

# Próximos Passos / Melhorias

Os próximos microprojetos poderão abordar temas como:

→ Views
→ Materialized Views
→ Procedures
→ Functions
→ Triggers
→ CTE (Common Table Expressions)
→ Window Functions
→ Particionamento
→ Estratégias de Indexação
→ Otimização de Consultas
→ Plano de Execução (EXPLAIN)

---

# 📂 Descrição completa do Projeto

```text
https://rafael-o-cunha.dev/projects/modelagem-de-dados-biblioteca
```

<a href="https://github.com/rafael-o-cunha/microprojeto_05_modelagem_de_dados/blob/main/README.md">
