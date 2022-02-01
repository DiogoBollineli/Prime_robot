*** Settings ***

Documentation            Todas as keywords responsaveis pelos testes web.

Resource                 ../../config/packages.robot


*** Keywords ***

Dado que o cliente esteja na tela de cadastro
    
    Title Should Be         Automação com Batista
    Wait Until Element Is Visible    xpath = //*[contains(text(), 'Novo Usuário!!')]
E preenche todos os campos
    Input Text    id=user_name        ${NOVO_USUARIO.nome}
    Input Text    id=user_lastname    ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_email       ${NOVO_USUARIO.email}
    Input Text    id=user_address     ${NOVO_USUARIO.endereco}
    Input Text    id=user_university  ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile     ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender      ${NOVO_USUARIO.genero}
    Input Text    id=user_age         ${NOVO_USUARIO.idade}

E preenche todos os campos exceto o campo nome
    Input Text    id=user_lastname    ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_email       ${NOVO_USUARIO.email}
    Input Text    id=user_address     ${NOVO_USUARIO.endereco}
    Input Text    id=user_university  ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile     ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender      ${NOVO_USUARIO.genero}
    Input Text    id=user_age         ${NOVO_USUARIO.idade}

E clicar em criar
    Click Button    xpath=//input[@value='Criar']  
Então deverá ser aprensetada a mensagem "${MENSAGEM}"
    Wait Until Element Is Visible     xpath=//*[contains(text(), "${MENSAGEM}")]
    Wait Until Page Contains          ${NOVO_USUARIO.nome}
    Wait Until Page Contains          ${NOVO_USUARIO.ult_nome}
    Wait Until Page Contains          ${NOVO_USUARIO.email}
    Wait Until Page Contains          ${NOVO_USUARIO.endereco}
    Wait Until Page Contains          ${NOVO_USUARIO.universidade}
    Wait Until Page Contains          ${NOVO_USUARIO.profissao}
    Wait Until Page Contains          ${NOVO_USUARIO.genero}
    Wait Until Page Contains          ${NOVO_USUARIO.idade}    
 Então deve ser apresentada a mensagem "${MENSAGEM}"
    Wait Until Element Is Visible     xpath=//*[contains(text(), "${MENSAGEM}")]
    Wait Until Page Contains          ${NOVO_USUARIO.nome}
    Wait Until Page Contains          ${NOVO_USUARIO.ult_nome}
    Wait Until Page Contains          ${NOVO_USUARIO.email}
    Wait Until Page Contains          ${NOVO_USUARIO.endereco}
    Wait Until Page Contains          ${NOVO_USUARIO.universidade}
    Wait Until Page Contains          ${NOVO_USUARIO.profissao}
    Wait Until Page Contains          ${NOVO_USUARIO.genero}
    Wait Until Page Contains          ${NOVO_USUARIO.idade}    


##########################################################################################################

Dado que eu esteja na tela de lista de usuários
    Title Should Be                  Automação com Batista
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Lista de Usuários!!")]
E clique na opção NOVO USUÁRIO
    Click Element                    xpath=//*[contains(text(), "Novo Usuário")]
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Novo Usuário!!")]
Quando finalizar o cadastro preenchendo todos os campos
    Input Text    id=user_name        ${NOVO_USUARIO.nome}
    Input Text    id=user_lastname    ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_email       ${NOVO_USUARIO.email}
    Input Text    id=user_address     ${NOVO_USUARIO.endereco}
    Input Text    id=user_university  ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile     ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender      ${NOVO_USUARIO.genero}
    Input Text    id=user_age         ${NOVO_USUARIO.idade}
    Click Button  xpath=//input[@value='Criar']  