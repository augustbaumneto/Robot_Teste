

*** Settings ***
Resource    ../resources/Pages/Main.resource



Test Setup    carregar site advantagesOnlineShopping e logar    https://advantageonlineshopping.com/#/    gc    admin    adm1n
Test Teardown    fechar site advantagesOnlineShopping
Library    ../.venv/Lib/site-packages/robot/libraries/OperatingSystem.py
Library    ../.venv/Lib/site-packages/robot/libraries/String.py

*** Variables ***


*** Test Cases ***
CT1 - Buscar produto
    ${PRODUTO}    Convert To String    HP ROAR WIRELESS SPEAKER
    Given expandir barra de busca
    And buscar produto    ${PRODUTO}
    Then pagina produto sera exibida    ${PRODUTO}

CT2 - Finalizar compras
    ${PRODUTO}    Convert To String    HP ROAR WIRELESS SPEAKER
    ${METODO_PAGAMENTO}    Convert To String    safepay
    ${USERNAME}    Convert To String    admin
    ${PASSWORD}    Convert To String    Adm1n
    ${QUANTIDADE_PRODUTO_ADDICIONADO}    Convert To String    1
    Given adicionei 1 produto no carrinho de compras    ${PRODUTO}    ${QUANTIDADE_PRODUTO_ADDICIONADO}
    And click botao checkout
    And produto escolhido esta no resumo da compras    ${PRODUTO}
    And click botao next
    And seleciono metodo de pagamento    ${METODO_PAGAMENTO}    ${USERNAME}    ${PASSWORD}
    When click pagar
    Then compra finalizada com sucesso
