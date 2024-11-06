

*** Settings ***
Library    SeleniumLibrary
Resource    Main.resource

*** Variables ***
&{HomePage}    userIcon=//li/a[@id="menuUserLink"]
...    logedUserIcon=//span[@class="hi-user containMiniTitle ng-binding"]
...    searchButton=//li/a/div[@id="searchSection"]
...    inputSearchField=//input[@placeholder="Search AdvantageOnlineShopping.com"]
...    speakerLink=//div[@id="speakersImg"]
...    logOutLink=//label[@ng-click="signOut($event)"]

*** Keywords ***
executa acao ate o sucesso    
    [Arguments]    ${KW}    ${KWARGS}
    Wait Until Keyword Succeeds    10    1    ${KW}    ${KWARGS}

click icone usuario
    Wait Until Element Is Enabled    ${HomePage.userIcon}    10
    #Wait Until Element Is Visible    ${HomePage.userIcon}    10
    Wait Until Keyword Succeeds    15    1    Click Element    ${HomePage.userIcon}

click em Logout
    click icone usuario
    Click Element    ${HomePage.logOutLink}

sou desconectado do site
    Wait Until Element Is Visible    ${HomePage.userIcon}
    Wait Until Element Is Enabled    ${HomePage.userIcon}

expandir barra de busca
    Wait Until Keyword Succeeds    30    1    Click Element     ${HomePage.searchButton}

buscar produto
    [Arguments]    ${PRODUTO}
    Input Text     ${HomePage.inputSearchField}    ${PRODUTO}
    Wait Until Element Is Visible    //p[text()="${PRODUTO}"]
    Wait Until Keyword Succeeds    15    1    Click Element    //p[text()="${PRODUTO}"]

pagina produto sera exibida
    [Arguments]    ${PRODUTO}
    ${elements}    Get WebElements   //h1[text()=" ${PRODUTO} "]
    ${count}    Get Length    ${elements}
    Should Be Equal    ${count}    2

    

