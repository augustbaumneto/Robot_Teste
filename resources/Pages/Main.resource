

*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Resource    HomePage.resource
Resource    Login.resource

*** Variables ***
#${env}    Load Json From File    ../../data/advantagesonlineshopping.json
#${siteURL}    Get Value From Json    ${env}    $url
*** Keywords ***
carregar site advantagesOnlineShopping
    [Arguments]    ${URL}    ${BROWSER}
    Open Browser    https://advantageonlineshopping.com/#/    ${BROWSER}
    Maximize Browser Window

fechar site advantagesOnlineShopping
    Close Browser
