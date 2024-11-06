

*** Settings ***
Resource    ../resources/Pages/Main.resource



Test Setup    carregar site advantagesOnlineShopping    https://advantageonlineshopping.com/#/    gc
Test Teardown    fechar site advantagesOnlineShopping
Library    ../.venv/Lib/site-packages/robot/libraries/OperatingSystem.py

*** Variables ***


*** Test Cases ***
CT1 - Logar no site advantageonlineshopping.com
    [Documentation]    
    [Tags]    Regressivo
    Given form de login carregou
    And preencher username    admin
    And preencher password    adm1n
    When click botao login
    Then usuario logado com sucesso

CT2 - Logout do site advantageonlineshopping.com
    [Documentation]    
    [Tags]    Regressivo
    Given estou logado    admin    adm1n
    When click em Logout
    Then sou desconectado do site