# Desafio VR - QA

## Descrição do Projeto

Este projeto foi desenvolvido como parte do processo seletivo da VR Benefícios para a posição de QA. Ele inclui testes automatizados para validar a funcionalidade de adição de produtos ao carrinho em uma loja virtual (frontend) e a verificação de um endpoint de consulta de produtos e estabelecimentos (backend).

## Tecnologias Utilizadas

- **Frontend:** Cypress
- **Backend:** Cucumber, Ruby, HTTParty

## Estrutura do Projeto

```plaintext
desafio_vr/
├── Frontend/                        # Testes automatizados de frontend
|   ├── cypress/                     
│   |  ├── e2e/
|   |     ├── feature/
|   |     └── steps/ 
│   |  ├── plugins/
│   |  └── support/
│   └── node_modules/
|
├── Backend/                         # Testes automatizados de backend
|   ├── features/                    
│   |   └── step_definitions/
│   ├── lib/
|   ├── Gemfile                     # Dependências do projeto Ruby
|   └── Gemfile.lock                # Versões exatas das dependências Ruby
|
├── videos/                      # Vídeos de demonstração
│   ├── desafio_vr_backend.mp4
│   └── desafio_vr_frontend.mp4
│
└── README.md                    # Instruções e informações do projeto
```

## Instruções de Configuração
### Frontend
1. Clone o repositório:

    ```bash
    git clone https://github.com/usuario/desafio_vr.git
    ```
2. Instale as dependências:

    ```bash
    npm install
    ```

### Backend
1. Instale o bundler, caso não tenha:

    ```bash
    gem install bundler
    ```
2. Instale as dependências do projeto:

    ```bash
    bundle install
    ```

## Instruções de Execução
### Frontend
#### Para executar os testes de frontend com Cypress:
1. Execute o Cypress:

    ```bash
    npx cypress open
    ```
2. Selecione o teste de adição ao carrinho e execute.

### Backend
#### Para executar os testes de backend com Cucumber e Ruby:
1. Execute os testes:

    ```bash
    bundle exec cucumber
    ```

## Informações Adicionais

- **Vídeos de Demonstração:**
     - [Desafio VR Frontend](https://github.com/rsouzacosta/desafio_vr/raw/main/videos/desafio_vr_frontend.mp4)
     - [Desafio VR Backend](https://github.com/rsouzacosta/desafio_vr/raw/main/videos/desafio_vr_backend.mp4)

- **Regras do Desafio:**
    - O exercício deve ser entregue em um repositório público do GitHub.
    - Inclua comentários nos arquivos para facilitar o entendimento.
