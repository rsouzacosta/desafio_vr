describe('Adicionar produto ao carrinho', () => {
    // Executa antes de cada teste limpando os cookies e local storage
    before(() => {
        cy.clearCookies()
        cy.getCookies().should('be.empty')
        cy.clearLocalStorage()
        cy.getAllLocalStorage().should('be.empty')
    });
    
    it('Deve adicionar o produto "Auto" ao carrinho com sucesso', () => {
      // Aprendi essa validacao abaixo https://youtu.be/l28bRsZckB8?si=bu-2Mx5-9FL-7EkH
      // Acessar a home do portal web e substituir a função 'open' para evitar a abertura de uma nova aba
      cy.visit('https://www.vr.com.br').then(win => {
        // Stub da função 'open' do objeto 'window' para capturar chamadas e evitar que uma nova aba seja aberta
        cy.stub(win, 'open').as('open');
      });
      
      // Clique no botão "Compre online"
      cy.get('#buttonCompreOnline').should('be.visible').click();
      
      // Verifica se a função 'open' foi chamada com o URL correto e o target '_blank'
      cy.get('@open').should('have.been.calledWith', 'https://loja.vr.com.br/', '_blank');

      // Forçar a navegação para a página da loja na mesma aba, pois a navegação original é interceptada
      cy.visit('https://loja.vr.com.br/');

      // Espera explícita para garantir que a página da loja foi carregada
      cy.url().should('include', 'https://loja.vr.com.br/');
    
      // Fechar o modal de boas-vindas
      cy.get('.close-button').click();
    
      // Fechar o modal de cookies se estiver visível
      cy.get('[data-testid="terms-consent"]').click();
    
      // Adicionar uma espera explícita para garantir que os modais foram fechados
      // Entendo que esse nao e melhor metodo, talvez usar Should NOT visible
      cy.wait(2000);
        
      // Selecionar a opção "Cartões VR"
      cy.contains('Cartões VR').should('be.visible').click();

      //Adicionar uma quantidade aleatória de cartões do produto 'Auto'
      const quantidade = Math.floor(Math.random() * 10) + 1; // Gera uma quantidade aleatória entre 1 e 10
      const quantidadeFormatada = quantidade < 10 ? `0${quantidade}` : quantidade.toString(); // Formata a quantidade com zero à esquerda se for menor que 10
      cy.get('#produto-auto-quantidade').should('be.visible').clear().type(quantidade);

      //Digitar um valor de crédito aleatório para o produto 'Auto'
      const valorCredito = (Math.random() * 100).toFixed(2); // Gera um valor aleatório entre 0 e 100 com duas casas decimais
      // Valor no minimo 1,00
      if (parseFloat(valorCredito) < 1.00) {
        valorCredito = '1.00';
      }
      cy.get('#produto-auto-valor').should('be.visible').clear().type(valorCredito);

      // Clicar no botão "Adicionar ao carrinho"
      cy.get('#btn-adicionar-carrinho-auto').should('be.visible').click();
      
      // Validar que o produto foi adicionado ao carrinho com sucesso
      cy.contains('Produto adicionado!').should('be.visible');
      
      // Validar que a quantidade e o valor do crédito estão corretos no carrinho
      cy.get('#btn-meu-carrinho').should('be.visible').click().then(() =>{
        cy.get('.product-information__value').within(() => {
          cy.get('span').first().should('have.text', 'Valor por cartão');
          cy.get('span').last().should('have.text', `R$\u00a0${valorCredito.replace('.', ',')}`); //\u00a0 para remover o caracter especial de espaco &nbsp
        })
        cy.get('.product-information__amount').within(() => {
          cy.get('span').first().should('have.text', 'Quantidade cartões');
          cy.get('span').last().should('have.text', quantidadeFormatada);
        })
      });
    });
  });
  