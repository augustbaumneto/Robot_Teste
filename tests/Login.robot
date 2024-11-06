

*** Settings ***
Resource    ../resources/Pages/Main.resource



Test Setup    carregar site advantagesOnlineShopping    https://advantageonlineshopping.com/#/    ff
Test Teardown    fechar site advantagesOnlineShopping

*** Variables ***


*** Test Cases ***
CT1 - Logar no site advantageonlineshopping.com
    Element Should Be Visible    ${HomePage.userIcon} 