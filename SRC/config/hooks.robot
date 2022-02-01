*** Settings ***

Documentation          Aqui estarão presenter todos os arquivos de inicialização e finalização dos testes.

Resource               ../config/packages.robot

*** Keywords ***      

abrir navegador
    Open Browser            about:blank        chrome        options=add_experimental_option('excludeSwitches', ['enable-logging'])
    maximize browser window
    go to                   https://automacaocombatista.herokuapp.com/users
    Set Selenium Timeout    20
fechar navegador
    Capture Page Screenshot
    Close Browser
Então deve ser apresentada a mensagem "${ERRO}"
    Wait Until Page Contains    ${ERRO}