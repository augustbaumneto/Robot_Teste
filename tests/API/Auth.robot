

*** Settings ***
Resource    ../../resources/API/Auth.resource

*** Variables ***
${token}

*** Test Cases ***
CT1 - Gerar Token com sucesso
    [Documentation]    Autentica na API e recupra token e dados do usuário
    [Tags]    desafio-INM    Login
    gerar token

CT2 - Buscar todos produtos
    Given gerar token
    When request buscar todos produtos
    Then response retornou 200 OK

CT3 - Buscar produto por nome
    Given gerar token
    And seleciona produto aleatorio
    When request buscar produto por nome
    Then response retornou 200 OK

