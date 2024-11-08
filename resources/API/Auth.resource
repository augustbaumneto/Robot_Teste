

*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    ../../.venv/Lib/site-packages/robot/libraries/String.py

*** Variables ***
${SERVER_AUTH}    http://www.advantageonlineshopping.com/accountservice
${SERVER_CATALOG}    http://www.advantageonlineshopping.com/catalog  
${CAMINHO_ARQUIVO}    1728429633928.jpg

${user_id}
${token}
${resp}
${productName}
${productId}
${categoryId}

*** Keywords ***
criar sessao em /accountservice
    Create Session    accountservice    ${SERVER_AUTH}

criar sessao em /catalog
    Create Session    catalog    ${SERVER_CATALOG}

gerar token
    criar sessao em /accountservice
    &{data}    Create Dictionary    email=admin@admin.ad  loginPassword=adm1n  loginUser=admin
    ${resp}    POST On Session    accountservice    /accountrest/api/v1/login    json=${data}    expected_status=anything
    ${token}    Get Value From Json    ${resp.json()}    $..statusMessage.token
    ${user_id}     Get Value From Json    ${resp.json()}    $..statusMessage.userId
    Status Should Be    200    ${resp}
    &{headers}         Create Dictionary       Authorization=${token}[0]    Content-Type=application/json
    Set Suite Variable    ${headers}
    Set Suite Variable    ${user_id}

request buscar todos produtos
    criar sessao em /catalog
    ${resp}    GET On Session    catalog    /api/v1/products    headers=${headers}    expected_status=anything
    Set Suite Variable    ${resp}

response retornou 200 OK
    request buscar todos produtos
    Status Should Be    200    ${resp}

seleciona produto aleatorio
    request buscar todos produtos
    response retornou 200 OK
    ${listaprodutos}    Get Value From Json    ${resp.json()}    $..products
    ${len}    Get Length    ${listaprodutos}[0]
    Set Suite Variable    ${listaprodutos}

request buscar produto por nome
    ${len}    Get Length    ${listaprodutos}[0]
    ${i}    Evaluate    random.sample(range(0,${len}), 1)    random  
    ${productName}    Convert To String    ${listaprodutos}[0][${i}[0]][productName]
    ${productId}    Get Variable Value    ${listaprodutos}[0][${i}[0]][productId]
    ${categoryId}    Get Variable Value    ${listaprodutos}[0][${i}[0]][categoryId]
    criar sessao em /catalog
    ${resp}    GET On Session    catalog    /api/v1/products/search    headers=${headers}    params=name=${productName}    expected_status=anything
    Set Suite Variable    ${resp}
    Set Suite Variable    ${productName}
    Set Suite Variable    ${productId}
    Set Suite Variable    ${categoryId} 
    response retornou 200 OK

request atualizar imagem do produto
    [Arguments]    ${COR}
    ${id}    Convert To Integer    ${user_id}[0]
    ${arquivo}    Create Dictionary    file=@${CAMINHO_ARQUIVO}
    criar sessao em /catalog
    ${resp}    POST On Session    catalog    /api/v1/product/image/${id}/1/${COR}    params=product_id=${productId}    headers=${headers}    files=${arquivo}    expected_status=anything
    Set Suite Variable    ${resp}

    
