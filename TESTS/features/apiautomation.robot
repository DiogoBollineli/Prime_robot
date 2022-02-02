*** Settings ***

Documentation                           Aqui estarão presentes todos os testes de api.

Resource                                ../../SRC/auto/keywords/kws_web.robot
*** Test Cases ***

Cenario: Realizar a consulta de livros
    [Tags]            teste
    Create Session                      booksAPI                 https://fakerestapi.azurewebsites.net/api/v1        disable_warnings=${True}
    ${HEADERS}                          Create Dictionary        content-type=application/json
    Set Test Variable                   ${HEADERS}

    ${RESPOSTA}                         GET On Session            booksAPI        Books        expected_status=any
    Set Task Variable                   ${RESPOSTA}

    Should Be Equal As Strings          ${RESPOSTA.status_code}    200            
    Should Be Equal As Strings          ${RESPOSTA.reason}         OK            
