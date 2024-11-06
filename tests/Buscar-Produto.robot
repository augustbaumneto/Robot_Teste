

*** Settings ***
Resource    ../resources/Pages/Main.resource



Test Setup    carregar site advantagesOnlineShopping    https://advantageonlineshopping.com/#/    gc
Test Teardown    fechar site advantagesOnlineShopping
Library    ../.venv/Lib/site-packages/robot/libraries/OperatingSystem.py

*** Variables ***


*** Test Cases ***
CT1 - Buscar produto
    ${PRODUTO}    Convert To String    HP ROAR WIRELESS SPEAKER
    Given expandir barra de busca
    And buscar produto    ${PRODUTO}
    Then pagina produto sera exibida    ${PRODUTO}

#CT2 - Adicionar produto ao carrinho de compras
    #Given estou na pagina do produto 