<p align="center">
  <h1>
    Microproyecto: Modelado de Datos (Biblioteca)
  </h1>
</p>

<div style="display: flex; align-items: center; padding: 10px;">
  <span>
    <a href="https://github.com/rafael-o-cunha/">
        <img src="https://img.shields.io/badge/-Home-black?style=for-the-badge" alt="Volver al Perfil">
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

# 📋 Resumen

Este microproyecto fue desarrollado con el objetivo de practicar el proceso completo de modelado de datos utilizado durante el desarrollo de software.

Utilizando como dominio un **Sistema de Biblioteca Escolar**, el proyecto recorre todas las etapas clásicas de la ingeniería de datos, desde el levantamiento de requisitos hasta la implementación física de la base de datos en PostgreSQL.

Además de la construcción del modelo, el proyecto incluye su validación mediante operaciones SQL, consultas operativas, consultas históricas, consultas gerenciales y un documento de evidencias que demuestra que el modelo satisface las necesidades del dominio.

Más que construir una base de datos funcional, este microproyecto fue concebido como un laboratorio para comprender cómo evoluciona un modelo de datos a lo largo del ciclo de vida del desarrollo de software.

---

![DER Final](docs/image/notas/der_materializado.png)

---

> **⚠️ Acerca de este microproyecto**
>
> Este proyecto tiene un propósito exclusivamente educativo.
>
> El objetivo no fue únicamente construir una base de datos, sino practicar todas las etapas involucradas en el modelado de datos utilizadas en proyectos reales de software.
>
> Para mantener el enfoque en el proceso de modelado, temas como optimización de consultas, procedimientos almacenados, triggers, vistas materializadas y estrategias avanzadas de rendimiento fueron intencionalmente reservados para futuros microproyectos.
>
> En otras palabras: **el objetivo no es construir la base de datos perfecta, sino comprender profundamente los fundamentos del modelado de datos antes de avanzar hacia arquitecturas y recursos más avanzados.**

---

# Conceptos Practicados

## Levantamiento de Requisitos

- Identificación del dominio
- Levantamiento de requisitos funcionales y no funcionales
- Identificación de las entidades del negocio
- Levantamiento de la información necesaria

## Reglas de Negocio

- Formalización de las reglas del negocio
- Identificación de las entidades afectadas
- Trazabilidad entre las reglas y el modelo

## Modelado Conceptual

- Identificación de entidades
- Relaciones
- Cardinalidades
- Evolución del DER
- Resolución de relaciones N:M

## Modelado Lógico

- Definición de atributos
- Claves primarias
- Claves foráneas
- Entidades asociativas
- Normalización

## Diccionario de Datos

- Documentación de atributos
- Tipos de datos
- Restricciones
- Valores por defecto
- Reglas relacionadas

## Modelo Físico

- Implementación en PostgreSQL
- Constraints
- Integridad referencial
- Índices
- Scripts SQL

## Validación del Modelo

El modelo fue validado mediante:

- Operaciones CRUD
- Consultas Operativas
- Consultas Históricas
- Consultas Gerenciales
- Documento de Evidencias

---

# Proceso de Modelado

El desarrollo siguió el siguiente flujo.

- Levantamiento de requisitos
- Reglas de negocio
- Entidades
- DER
- Diccionario de datos
- Conjunto de consultas para validar el modelo
- Implementación en SQL ANSI
- Documento de evidencias

---

# Artefactos Generados

Durante el desarrollo fueron producidos los siguientes documentos.

- Levantamiento de Requisitos
- Reglas de Negocio
- Modelo Conceptual (DER)
- Modelo Lógico
- Diccionario de Datos
- Modelo Físico
- Scripts de Seed
- Operaciones SQL
- Consultas Operativas
- Consultas Históricas
- Consultas Gerenciales
- Documento de Evidencias

---

# Tecnologías

- PostgreSQL
- SQL ANSI
- Docker
- Docker Compose
- Makefile
- DBeaver
- Markdown

---

# 📂 Estructura del Proyecto

```text
.
├── docs
│   ├── 01-levantamiento_requisitos.md
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

# Validación

La base de datos fue validada mediante cuatro grupos de consultas.

| Grupo | Objetivo |
|-------|----------|
| Operaciones | Validar inserciones, actualizaciones y procesos del sistema |
| Consultas Operativas | Responder preguntas utilizadas en el funcionamiento diario de la biblioteca |
| Consultas Históricas | Recuperar información histórica preservada por el modelo |
| Consultas Gerenciales | Generar indicadores para apoyar la toma de decisiones |

---

# Evidencias

El proyecto incluye un documento de evidencias que contiene la ejecución del modelo físico.

Se documentaron evidencias de:

- Creación de la base de datos
- Carga inicial (Seed)
- Ejecución de operaciones
- Consultas operativas
- Consultas históricas
- Consultas gerenciales

---

# Conceptos Practicados

Durante este microproyecto se trabajaron los siguientes conceptos.

- Levantamiento de Requisitos
- Reglas de Negocio
- Ingeniería de Requisitos
- Modelado Conceptual
- Modelo Entidad-Relación (MER)
- Diagrama Entidad-Relación (DER)
- Cardinalidades
- Entidades Asociativas
- Normalización
- Modelo Lógico
- Modelo Físico
- Diccionario de Datos
- PostgreSQL
- SQL ANSI
- Claves Primarias
- Claves Foráneas
- Claves Compuestas
- Integridad Referencial
- Constraints
- Índices
- Scripts DDL
- Scripts DML
- Seed Database
- Consultas SQL
- Gobernanza de Datos
- Documentación Técnica
- Entre otros...

---

# Próximos Pasos / Mejoras

Los próximos microproyectos podrán abordar temas como:

→ Views

→ Materialized Views

→ Stored Procedures

→ Functions

→ Triggers

→ CTE (Common Table Expressions)

→ Window Functions

→ Particionamiento

→ Estrategias de Indexación

→ Optimización de Consultas

→ Planes de Ejecución (EXPLAIN)

---

# 📂 Descripción Completa del Proyecto

```text
https://rafael-o-cunha.dev/projects/modelagem-de-dados-biblioteca
```
