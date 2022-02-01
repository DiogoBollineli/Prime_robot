*** Settings ***
Documentation         Primeiro teste robot pelo curso de robot prime.

*** Variables ***
${CLIENTE}    https://h3sgi.e-boticario.com.br/Paginas/Inicializacao/AguardarAcao.aspx

&{PESSOA}    
...    nome=Diogo
...    sobrenome=Bollineli
...    idade=19
...    cpf=13771118905
...    rg=123456789
...    cep=815605870 

@{FRUTAS}
...    manga
...    maça
...    pera
...    abacate
...    limão
...    maracuja
...    coco
...    laranja

*** Test Cases ***
Cenario 1: Imprimir dicionario no console
    [Tags]            dicionario
    Log To Console    \n${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.cpf}
    Log To Console    ${PESSOA.rg}
    Log To Console    ${PESSOA.cep}
Cenario 2: imprimir lista de frutas
    [Tags]            LISTA
    Log To Console    \n${FRUTAS[0]}
    Log To Console    ${FRUTAS[1]}
    Log To Console    ${FRUTAS[2]}
    Log To Console    ${FRUTAS[3]}
    Log To Console    ${FRUTAS[4]}
    Log To Console    ${FRUTAS[5]}
    Log To Console    ${FRUTAS[6]}
    Log To Console    ${FRUTAS[7]}
Cenario 3: somar dois numeros
    [Tags]            Soma
    Somar dois numeros    123    123
    Somar os numeros "12345" e "12345"
Cenario 4: Criar email
    [Tags]        EMAIL
    Criar meu email    Diogo    bollineli    19
Cenario 5: Contar de 0 a 25
    [Tags]        Contar
    Percorrer lista de frutas
Cenario 6: contar até 10
    [Tags]       010
    Contar até 10
*** Keywords ***
Somar dois numeros
    [Arguments]    ${NUM_A}    ${NUM_B} 
    ${SOMA}        Evaluate    ${NUM_A}+${NUM_B}
    [Return]       ${SOMA}
Somar os numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}        Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    ${SOMA}
    [Return]       ${SOMA}
Criar meu email     
    [Arguments]    ${NAME}    ${LASTNAME}    ${AGE}
    ${EMAIL}       Catenate    SEPARATOR=_    ${NAME}    ${LASTNAME}    ${AGE}@robot.com
    Log To Console     ${EMAIL}
    [Return]           ${EMAIL} 
Percorrer lista de frutas
    FOR    ${fruta}    IN    @{FRUTAS}    
        Log To Console        ${fruta}
      END 
Contar até 10
    FOR    ${element}    IN RANGE    0     11
        IF    '${element}'=='5' 
        Log to console    \nEstou no número: ${element}
        ELSE IF    '${element}'=='8'
        Log To Console    Estou no número: ${element}
        END
    END