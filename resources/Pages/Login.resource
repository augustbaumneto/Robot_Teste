

*** Settings ***
Library    SeleniumLibrary
Resource    Main.resource

*** Variables ***
&{Login}    usernameField=//input[@name="username"]
...    passwordField=//input[@name="password"]
...    loginButton=//button[@id="sign_in_btn"]

*** Keywords ***
