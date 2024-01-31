*** Settings ***
Resource    ../resource/server-rest-front.resource    #../resource/server-rest-front.resource
# Resource  ../evidencies/traces
*** Test Cases ***
Login com sucesso no Server Rest front
    Abrir o Navegador
    Ir para o site Server Rest Front
    Preencher os dados do novo usuario e cadastrar
    Conferir usuário cadastrado com sucesso

Desafio: Conferir se o novo usuario é mostrado na listagem de usuarios
    Cadastrar novo usuário
    Acessar a lista de usuários
    Conferir que o usuário aparece na listagem

Desafio: Cadastrar um produto
  Cadastrar novo usuário
  Cadastrar um novo produto
  Conferir que o produto aparece na listagem

Exemplo utilizando Requisições HTTP
  [Tags]  api
  Abrir o Navegador
  Ir para o site Server Rest Front
  Criar Usuario via API    
  Logar com o usuário cadastrado via API

Exemplo Utilizando o Storage Armazenado no Contexto
  [Tags]  contexto
  Cadastrar Usuário e Logar
  Abrir o Site Serve Rest Front Logado
  Acessar a Lista de usuários
  