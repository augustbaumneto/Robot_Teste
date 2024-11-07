

*** Settings ***
Library    SeleniumLibrary
Resource    Main.resource

*** Variables ***
&{OrderPayment}    pageTitle=//h3[text()="ORDER PAYMENT"]
...    orderSummaryTitle=//h5[text()=" ORDER SUMMARY"]
...    productsToPay=//table[@ng-show="cart.productsInCart.length > 0" and not(@style)]//h3[text()="HP ROAR WIRELESS SPEAKER"]
...    safepayUserName=//input[@name="safepay_username"]
...    safepayPassword=//input[@name="safepay_password"]
...    buttonPay=//button[@id="pay_now_btn_SAFEPAY"]
...    buttonNext=//button[@translate="NEXT"]
...    thanksMessage=//span[@translate="Thank_you_for_buying_with_Advantage"]
...    trackingNumber=//label[@id="trackingNumberLabel"]
...    orderNumber=//label[@id="orderNumberLabel"]

*** Keywords ***
click botao next
    Wait Until Element Is Visible    ${OrderPayment.buttonNext}
    Wait Until Keyword Succeeds    10    1    Click Element     ${OrderPayment.buttonNext}

produto escolhido esta no resumo da compras
    [Arguments]    ${PRODUTO}
    Wait Until Element Is Visible    ${OrderPayment.pageTitle}
    Wait Until Keyword Succeeds    10    1    Wait Until Element Is Visible    ${OrderPayment.orderSummaryTitle}
    Element Should Contain    ${OrderPayment.productsToPay}    ${PRODUTO}

seleciono metodo de pagamento
    [Arguments]    ${METODO_PAGAMENTO}    ${USERNAME}    ${PASSWORD}
    #Wait Until Keyword Succeeds    15    1    Wait Until Element Is Visible    //input[@name="${METODO_PAGAMENTO}"]
    Wait Until Keyword Succeeds    10    1    Wait Until Element Is Visible    ${OrderPayment.safepayUserName}
    Wait Until Keyword Succeeds    10    1    Wait Until Element Is Visible    ${OrderPayment.safepayPassword}
    Input Text    ${OrderPayment.safepayUserName}    ${USERNAME}
    Input Password    ${OrderPayment.safepayPassword}    ${PASSWORD}

click pagar
    Wait Until Element Is Visible    ${OrderPayment.buttonPay}
    Wait Until Element Is Enabled    ${OrderPayment.buttonPay}
    Wait Until Keyword Succeeds    10    1    Click Element    ${OrderPayment.buttonPay}
    
compra finalizada com sucesso
    Wait Until Element Is Visible    ${OrderPayment.thanksMessage}
    Wait Until Element Is Enabled    ${OrderPayment.trackingNumber}
    Wait Until Element Is Enabled    ${OrderPayment.orderNumber}
    Page Should Contain Element    ${OrderPayment.thanksMessage}
    Page Should Contain Element    ${OrderPayment.trackingNumber}
    Page Should Contain Element    ${OrderPayment.orderNumber}
    ${tks}    Get Text    ${OrderPayment.thanksMessage}
    ${trak}    Get Text    ${OrderPayment.trackingNumber}
    ${order}    Get Text    ${OrderPayment.orderNumber}
    
