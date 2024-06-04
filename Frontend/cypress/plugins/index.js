const cucumber = require('cypress-cucumber-preprocessor').default;

module.exports = (on, config) => {
  const options = {
    // Adicione suas opções aqui, se necessário
  };

  on('file:preprocessor', cucumber(options));
  return config;
};
