# 🚀 API Go-Gin: Sistema de Gestão de Alunos

![Go Version](https://img.shields.io/badge/Go-1.21-blue)
![CI/CD Status](https://img.shields.io/badge/CI%2FCD-Passing-brightgreen)
![License](https://img.shields.io/badge/License-MIT-green)

Esta é uma API REST desenvolvida em **Go** utilizando o framework **Gin**. O projeto foi construído focando em boas práticas de desenvolvimento, segurança e integração contínua (CI/CD).

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Go (Golang)
* **Framework Web:** Gin Gonic
* **ORM:** GORM (PostgreSQL)
* **Banco de Dados:** PostgreSQL (Dockerizado)
* **Testes:** Testify
* **CI/CD:** GitHub Actions

## 🏗️ Arquitetura e CI/CD

O projeto conta com um pipeline de automação completo no GitHub Actions, garantindo a qualidade do código em cada `push`:

1.  **Qualidade e Linter:** Verificação estática de código com `golangci-lint`.
2.  **Testes de Integração:** Execução de testes automatizados com banco de dados real em container.
3.  **Cobertura:** Monitoramento da cobertura de testes (foco em manter acima de 40%).
4.  **Multi-OS Build:** Compilação automática de binários para **Linux, Windows e macOS**.



## 🔒 Segurança

Seguindo padrões de mercado, todas as credenciais sensíveis (como senhas de banco de dados) são gerenciadas via **GitHub Secrets** e variáveis de ambiente, garantindo que nenhuma informação sensível seja exposta no histórico do Git.

## 🚀 Como Executar

### Pré-requisitos
* Docker e Docker Compose
* Go 1.21+

### Passo a Passo
1. Clone o repositório:
   ```bash
   git clone [https://github.com/fefeluis91-crypto/aula_002.git](https://github.com/fefeluis91-crypto/aula_002.git)
