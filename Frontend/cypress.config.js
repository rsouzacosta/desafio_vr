const { defineConfig } = require('cypress');
const cucumber = require('cypress-cucumber-preprocessor').default;

module.exports = defineConfig({
  e2e: {
    // Define o diretório onde os arquivos de teste estão localizados
    specPattern: 'cypress/e2e/steps/**/*.spec.js',
    // Define o diretório onde os arquivos de feature Gherkin estão localizados
    supportFile: 'cypress/support/index.js',
    setupNodeEvents(on, config) {
      // Importe e use plugins ou qualquer configuração adicional aqui
      const options = {
        // Qualquer opção específica do cypress-cucumber-preprocessor pode ser definida aqui
      };
      on('file:preprocessor', cucumber(options));
      return config;
    },
  },
});
