// Este arquivo é processado e carregado automaticamente antes de seus arquivos de teste.
// É um bom lugar para adicionar comandos globais e outras configurações de inicialização.

// Importa comandos adicionais
// import './commands';

Cypress.on('uncaught:exception', (err, runnable) => {
    // Retorna false para prevenir que o Cypress falhe o teste
    // devido a exceções não capturadas originadas fora do escopo do teste
    return false;
});
  