

*** Settings ***
Resource    ../../resources/API/Auth.resource

*** Variables ***
${token}

*** Test Cases ***
CT1 - Gerar Token com sucesso
    [Documentation]    Autentica na API e recupra token e dados do usuário
    [Tags]    desafio-INM    token
    When gerar token
    Then response retornou 200 OK

CT2 - Buscar todos produtos
    [Documentation]    Busca todos os produtos do site
    [Tags]    desafio-INM
    Given gerar token
    When request buscar todos produtos
    Then response retornou 200 OK

CT3 - Buscar produto por nome
    [Documentation]    Busca por um produto por nome. Produto aleatorio de um produto do site
    [Tags]    desafio-INM
    Given gerar token
    And seleciona produto aleatorio
    When request buscar produto por nome
    Then response retornou 200 OK

CT4 - Atualizar imagem do produto
    [Documentation]    Atualiza a cor/imagem de um produto. Produto aleatorio de um produto do site
    [Tags]    desafio-INM
    Given gerar token
    And seleciona produto aleatorio
    And request buscar produto por nome
    When request atualizar imagem do produto    blue
    Then response retornou 200 OK

