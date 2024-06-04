Feature: Adicionar produtos ao carrinho

  Scenario: Adicionar o produto "Auto" ao carrinho com sucesso
    Given que o usuário acessa a home do portal web "https://www.vr.com.br"
    When o usuário clica no botão "Compre online"
    And o usuário seleciona a opção "Cartões VR"
    And o usuário adiciona uma quantidade aleatória de cartões do produto "Auto"
    And o usuário digita um valor de crédito aleatório para o produto "Auto"
    And o usuário clica no botão "Adicionar ao carrinho"
    Then o produto "Auto" deve ser adicionado ao carrinho com sucesso