

*** Settings ***
Library    SeleniumLibrary
Resource    Main.resource

*** Variables ***
&{ShoppingCart}    checkoutButton=//button[@id="checkOutButton"]

*** Keywords ***
click botao checkout
    Wait Until Element Is Visible    ${ShoppingCart.checkoutButton}
    Wait Until Keyword Succeeds    10    1    Click Element     ${ShoppingCart.checkoutButton}
