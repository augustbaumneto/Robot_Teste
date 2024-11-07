

*** Settings ***
Library    SeleniumLibrary
Resource    Main.resource

*** Variables ***
&{Login}    usernameField=//input[@name="username"]
...    passwordField=//input[@name="password"]
...    loginButton=//button[@id="sign_in_btn"]
...    loginForm=//div[@class="login ng-scope"]

*** Keywords ***
form de login carregou
    click icone usuario
    Wait Until Element Is Visible     ${Login.loginForm}    
    Wait Until Element Is Enabled    ${Login.usernameField}    
    Wait Until Element Is Enabled    ${Login.passwordField}    
    Wait Until Element Is Visible    ${Login.usernameField}    
    Wait Until Element Is Visible    ${Login.passwordField}    
    Element Should Be Enabled    ${Login.usernameField}
    Element Should Be Enabled    ${Login.passwordField}    
    Element Should Be Visible    ${Login.usernameField}    
    Element Should Be Visible    ${Login.passwordField}    

preencher username
    [Arguments]    ${USERNAME}
    Input Text    ${Login.usernameField}    ${USERNAME}

preencher password
    [Arguments]    ${PASSWORD}
    Input Text   ${Login.passwordField}    ${PASSWORD}

click botao login
    Wait Until Element Is Enabled    ${Login.loginButton}    
    Wait Until Element Is Visible    ${Login.loginButton}    
    Element Should Be Enabled    ${Login.loginButton}
    Wait Until Keyword Succeeds    15    1    Click Element    ${Login.loginButton}

usuario logado com sucesso
    Wait Until Keyword Succeeds    15    1    Element Should Be Visible    ${HomePage.logedUserIcon}

estou logado
    [Arguments]    ${USERNAME}    ${PASSWORD}
    form de login carregou
    preencher username    ${USERNAME}
    preencher password    ${PASSWORD}
    click botao login
    usuario logado com sucesso
    

    
