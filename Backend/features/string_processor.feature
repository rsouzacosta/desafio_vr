Feature: Processar String
    Scenario: Remover texto após marcadores (Scenario 1)
        Given a string de entrada "bananas, tomates # e ventiladores"
        And os marcadores '["#", "!"]'
        Then a saída esperada é "bananas, tomates"

    Scenario: Remover texto após marcadores (Scenario 2)
        Given a string de entrada "o rato roeu a roupa $ do rei % de roma"
        And os marcadores '["%", "!"]'
        Then a saída esperada é "o rato roeu a roupa $ do rei"

    Scenario: Remover texto após marcadores (Scenario 3)
        Given a string de entrada "the quick brown fox & jumped over * the lazy dog"
        And os marcadores '["&", "*", "%", "!"]'
        Then a saída esperada é "the quick brown fox"