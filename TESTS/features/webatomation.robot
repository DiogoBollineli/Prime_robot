*** Settings ***

Documentation    Automação web para o curso de robot.

Resource         ../../SRC/config/packages.robot

Library          SeleniumLibrary
Test Setup       abrir navegador
Test Teardown    fechar navegador
*** Variables ***
&{NOVO_USUARIO}
...                         nome=Diogo
...                         ult_nome=Bollineli
...                         email=diogo.teste@robot.com
...                         endereco=rua antonio calheiro rodrigues
...                         universidade=PUCPR
...                         profissao=analista QA
...                         genero=masculino
...                         idade=19
*** Test Cases ***
Cenario: criar usuario com sucesso
    [tags]                  ABRE_NAVEGADO
    Title Should Be         Automação com Batista
    Wait Until Element Is Visible    xpath = //*[contains(text(), 'Novo Usuário!!')]
    Input Text    id=user_name        ${NOVO_USUARIO.nome}
    Input Text    id=user_lastname    ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_email       ${NOVO_USUARIO.email}
    Input Text    id=user_address     ${NOVO_USUARIO.endereco}
    Input Text    id=user_university  ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile     ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender      ${NOVO_USUARIO.genero}
    Input Text    id=user_age         ${NOVO_USUARIO.idade}
    Click Button    xpath=//input[@value='Criar']
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Usuário Criado com sucesso')]
    Wait Until Page Contains          ${NOVO_USUARIO.nome}
    Wait Until Page Contains          ${NOVO_USUARIO.ult_nome}
    Wait Until Page Contains          ${NOVO_USUARIO.email}
    Wait Until Page Contains          ${NOVO_USUARIO.endereco}
    Wait Until Page Contains          ${NOVO_USUARIO.universidade}
    Wait Until Page Contains          ${NOVO_USUARIO.profissao}
    Wait Until Page Contains          ${NOVO_USUARIO.genero}
    Wait Until Page Contains          ${NOVO_USUARIO.idade}    
Cenario: Criar usuario BDD
    [Tags]             BDD
    Dado que o cliente esteja na tela de cadastro
    E preenche todos os campos
    E clicar em criar
    Então deverá ser aprensetada a mensagem "Usuário Criado com sucesso"
Cenario: Criar usuario sem informar nome
    [Tags]                sem_nome
    Dado que o cliente esteja na tela de cadastro
    E preenche todos os campos exceto o campo nome
    E clicar em criar
    Então deve ser apresentada a mensagem "Name translation missing: pt-BR.activerecord.errors.models.user.attributes.name.blank"
cenario: Criar usuário através da sessão de lista de novos usuários
    [Tags]                    Exercicio
    Dado que eu esteja na tela de lista de usuários
    E clique na opção NOVO USUÁRIO
    Quando finalizar o cadastro preenchendo todos os campos
    Então deve ser apresentada a mensagem "Usuário Criado com sucesso"