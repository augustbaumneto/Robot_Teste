

*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    HomePage.resource
Resource    Login.resource

*** Variables ***

*** Keywords ***
carregar site advantagesOnlineShopping
    [Arguments]    ${URL}    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

fechar site advantagesOnlineShopping
    Close Browser
