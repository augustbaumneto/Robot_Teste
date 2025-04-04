

*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Resource    HomePage.resource
Resource    Login.resource
Resource    ProductDetails.resource
Resource    ShoppingCart.resource
Resource    OrderPAyment.resource

*** Variables ***
#${env}    Load Json From File    ../../data/advantagesonlineshopping.json
#${siteURL}    Get Value From Json    ${env}    $url
*** Keywords ***
carregar site advantagesOnlineShopping
    [Arguments]    ${URL}    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

carregar site advantagesOnlineShopping e logar
    [Arguments]    ${URL}    ${BROWSER}    ${USERNAME}    ${$PASSWORD}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    estou logado    ${USERNAME}    ${$PASSWORD}

fechar site advantagesOnlineShopping
    #click em Logout
    #sou desconectado do site
    Close Browser
