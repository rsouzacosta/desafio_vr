Feature: Teste da API VR
  Scenario: Validar que a resposta JSON contém a chave 'typeOfEstablishment'
    Given que envio uma solicitação para a API VR
    Then a resposta deve conter a chave 'typeOfEstablishment'
    And eu imprimo um tipo de estabelecimento aleatoriamente