*** Settings ***
Library     Browser
...         timeout=00:00:15
...         enable_presenter_mode=${True}
Library     FakerLibrary
Library     DateTime


*** Variables ***
${BROWSER}              chromium
${HEADLESS}             ${False}
#${SITE_SERVER_REST}     https://front.serverest.dev/login

&{DADOS}
...                     nome=input[data-testid='nome']
...                     email=input[data-testid='email']
...                     senha=input[data-testid='password']
...                     cadastrar=button[data-testid='cadastrar']
...                     checkbox=input[id='administrador']
...                     title=Front - ServeRest

#SITE
...  SITE_SERVER_REST=https://front.serverest.dev/login

*** Keywords ***
#Login com sucesso no Server Rest front
Abrir o Navegador
    New Browser
    ...    browser=${BROWSER}
    ...    headless=${HEADLESS} 

    # ${TRACER_NAME}  FakerLibrary.Uuid 4
    # ${NOW}  Get Current Date  result_format=%d-%m-%Y_%H%M%S
    
    ${TRACE_NAME}  FakerLibrary.Uuid 4
    ${NOW}         Get Current Date  result_format=%d-%m-%Y_%H%M%S
    New Context    viewport={'width': 1200, 'height': 800}
    # ...            tracing=C:/Users/elrison.silva/Documents/robot-browser/evidencies/traces/${NOW}/${TRACE_NAME}.zip
    # ...            recordVideo={'dir':'C:/Users/elrison.silva/Documents/robot-browser/evidencies/videos/${NOW}'}

Ir para o site Server Rest Front
    New Page    ${DADOS.SITE_SERVER_REST}
    ${newTitle}    Get Title    ==    ${DADOS.title}
    Log    ${newTitle}

Preencher os dados do novo usuario e cadastrar
    Click    css=.btn-linkm

    ${EMAIL}    FakerLibrary.Email

    Fill Text    ${DADOS.nome}    Elrison Silva    # insere o nome faker
    Fill Text    ${DADOS.email}    ${EMAIL}    # insere o email
    Fill Text    ${DADOS.senha}    12345678    # insere a senha
    Check Checkbox    ${DADOS.checkbox}
    Click    ${DADOS.cadastrar}

Conferir usuário cadastrado com sucesso
    Wait For Elements State    h1    visible
    Get Text    h1    ==    Bem Vindo Elrison Silva
    Take Screenshot
#================================================================================================================= FIM DO Primeiro caso de teste

# Desafio: Conferir se o novo usuario é mostrado na listagem de usuarios

Cadastrar novo usuário
    Abrir o Navegador
    Ir para o site Server Rest Front
    Click    css=.btn-link

    ${EMAIL}    FakerLibrary.Email

    Fill Text    ${DADOS.nome}    Daniel Alves Rodrigues    # insere o nome faker
    Fill Text    ${DADOS.email}    ${EMAIL}    # insere o email
    Fill Text    ${DADOS.senha}    12345678    # insere a senha
    Check Checkbox    ${DADOS.checkbox}
    Click    ${DADOS.cadastrar}

Acessar a lista de usuários
    Click    .col-md-2:nth-child(3) .btn
    Take Screenshot

Conferir que o usuário aparece na listagem
    Wait For Elements State    (//td[contains(.,'Beltrano De Sá')])[1]    visible    10
    Get Text    (//td[contains(.,'Daniel Alves Rodrigues')])[1]    ==    Daniel Alves Rodrigues
    Take Screenshot
#================================================================================================================= FIM DO Segundo  caso de teste

# Desafio: Cadastrar um produto

Cadastrar um novo produto
    ${cel_faker}  FakerLibrary.Year
    Click    .col-md-2:nth-child(4) .btn
    Fill Text    //input[contains(@name,'nome')]    Galaxy S${cel_faker}
    Fill Text    \#price    13.000
    Sleep    4
    Fill Text
    ...    //textarea[contains(@name,'description')]
    ...    O primeiro celular com IA do mercado, com tradução automatica!
    Fill Text    //input[contains(@name,'quantity')]    10

    ${promisse}=    Promise To Upload File    ${CURDIR}/galaxyS24.png
    Click    //input[contains(@name,'imagem')]  
    ${file_add}  Wait For  ${promisse}  
    Click    xpath=//button[@data-testid='cadastarProdutos'][contains(.,'Cadastrar')]  
    Take Screenshot

Conferir que o produto aparece na listagem
    Wait For Elements State    //td[contains(.,'Galaxy S33')]   visible    10
    Get Text    //td[contains(.,'Galaxy S33')]    ==    Galaxy S33

#================================================================================================================= FIM DO 2 Desafio de teste

#Exemplo utilizando Requisições HTTP

Criar Usuario via API
  ${EMAIL}  FakerLibrary.Email
  Set Test Variable  ${EMAIL}

  ${resposta}  Http  url=https://serverest.dev/usuarios
  ...          method=POST
  ...          body={"nome": "Elrison Silva", "email": "${EMAIL}", "password": "123456","administrador": "true"}  

  Should Be Equal As Integers  ${resposta["status"]}  201

Logar com o usuário cadastrado via API
   ${EMAIL}  FakerLibrary.Email
  Set Test Variable  ${EMAIL}
  ${resposta}  Http  url=https://serverest.dev/login
  ...          method=POST
  ...          body={"email": "${EMAIL}", "password": "123456"}

   Should Be Equal As Integers  ${resposta["status"]}  401

   LocalStorage Set Item  serverest/userEmail  ${EMAIL}
   LocalStorage Set Item  serverest/userToken  ${resposta["body"]["authorization"]} 
   LocalStorage Set Item  serverest/userNome   Elrison Silva

   Go To  url=https://front.serverest.dev/admin/home

#================================================================================================================= FIM DO 2 Exemplo de teste

#Exemplo Utilizando o Storage Armazenado no Contexto
# Criar usuário via API
#     ${EMAIL}  FakerLibrary.Email
#     Set Suite Variable    ${EMAIL}

#     ${resposta}  Http    url=https://serverest.dev/usuarios
#     ...                  method=POST
#     ...                  body={"nome": "Elrison Silva","email": "${EMAIL}","password": "123456","administrador": "true"}   

Cadastrar Usuário e Logar
    New Browser   ${BROWSER}
    New Page      ${DADOS.SITE_SERVER_REST}
    Cadastrar novo usuário
    Logar com o usuário cadastrado via API
    ${STORAGE_FILE}  Save Storage State
    Set Suite Variable  ${STORAGE_FILE}
   

Abrir o Site Serve Rest Front Logado
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
    
    ${STORAGE_FILE}  Save Storage State
    Set Suite Variable  ${STORAGE_FILE}
    
    New Context    viewport={'width': 1200, 'height': 800}
    ...            storageState=${STORAGE_FILE}
    New Page       url=https://front.serverest.dev/admin/home
    Get Text       h1  ==  Bem Vindo Elrison Silva
    Take Screenshot