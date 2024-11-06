

*** Settings ***
Library    SeleniumLibrary
Resource    Main.resource

*** Variables ***
&{HomePage}    userIcon=//a[@id="hrefUserIcon"]
...    searchButton=//a[@title="SEARCH"]

*** Keywords ***
click icone usuario
    Wait Until Element Is Enabled    ${HomePage.userIcon}
    Wait Until Element Is Visible    ${HomePage.userIcon}
    Click Element    ${HomePage.userIcon}