

*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    ../../.venv/Lib/site-packages/robot/libraries/String.py

*** Variables ***
${token}
${resp}
${item}

*** Keywords ***
criar sessao em /accountservice
    Create Session    accountservice    http://www.advantageonlineshopping.com/accountservice

criar sessao em /catalog
    Create Session    catalog    http://www.advantageonlineshopping.com/catalog

gerar token
    criar sessao em /accountservice
    &{data}    Create Dictionary    email=admin@admin.ad  loginPassword=adm1n  loginUser=admin
    ${resp}    POST On Session    accountservice    /accountrest/api/v1/login    json=${data}    expected_status=anything
    ${token}    Get Value From Json    ${resp.json()}    $..statusMessage.token 
    Status Should Be    200    ${resp}
    Set Suite Variable    ${token}

request buscar todos produtos
    criar sessao em /catalog
    ${resp}    GET On Session    catalog    /api/v1/products    expected_status=anything
    Set Suite Variable    ${resp}

response retornou 200 OK
    request buscar todos produtos
    Status Should Be    200    ${resp}

seleciona produto aleatorio
    request buscar todos produtos
    response retornou 200 OK
    ${listaprodutos}    Get Value From Json    ${resp.json()}    $..products

    ${len}    Get Length    ${listaprodutos}[0]
    Log    ${len}
 
    #${item}    ${listaprodutos}
    Set Suite Variable    ${listaprodutos}

request buscar produto por nome
    ${len}    Get Length    ${listaprodutos}[0]
    ${i}    Evaluate    random.sample(range(0,${len}), 1)    random  
    criar sessao em /catalog
    ${resp}    GET On Session    catalog    /api/v1/products/search    params=name=${listaprodutos}[0][${i}[0]][productName]    expected_status=anything
    Set Suite Variable    ${resp}
    response retornou 200 OK
