

*** Settings ***
Library    SeleniumLibrary
Resource    Main.resource

*** Variables ***
&{ProductDetails}    productTitle=//h1[@class="roboto-regular screen768 ng-binding"]
...    addToCartButton=//button[@name="save_to_cart"]

*** Keywords ***
pagina produto sera exibida
    [Arguments]    ${PRODUTO}
    ${elements}    Get WebElements   //h1[@class="roboto-regular screen768 ng-binding"]
    Wait Until Element Is Visible    ${ProductDetails.productTitle}
    Element Should Contain    ${ProductDetails.productTitle}    ${PRODUTO}

estou na pagina do produto
    [Arguments]    ${PRODUTO}
    expandir barra de busca
    buscar produto    ${PRODUTO}
    pagina produto sera exibida    ${PRODUTO}

click botao adicionar ao carrinho
    Wait Until Element Is Visible    ${ProductDetails.addToCartButton}
    Wait Until Keyword Succeeds    10    1    Click Element     ${ProductDetails.addToCartButton}

icone carrinho recebe produto
    [Arguments]    ${QUANTIDADE_PRODUTO_ADDICIONADO}
    Wait Until Keyword Succeeds    10    1    Element Should Contain    ${HomePage.shoppingCartIcon}     ${QUANTIDADE_PRODUTO_ADDICIONADO}

adicionei 1 produto no carrinho de compras
    [Arguments]    ${PRODUTO}    ${QUANTIDADE_PRODUTO_ADDICIONADO}    
    estou na pagina do produto    ${PRODUTO}
    click botao adicionar ao carrinho
    icone carrinho recebe produto    ${QUANTIDADE_PRODUTO_ADDICIONADO}
    click icone carrinho
    