*** Settings ***
Documentation        Suite de testes do home page 
Library    Browser

 

Resource               ../resources/base.resource

Test Setup      Start_session           #ACRESCENTANDO ESTAS PALAVRAS NÃO NECESSITA COLOCA-LAS A BAIXO
Test Teardown   Finish Session

*** Test Cases ***
Deve cadastrar um novo dog walker
   
   ${dog_walker}  Create Dictionary
    ...   name=Natanael
    ...   email=ngsneto@gmail.com
    ...   cpf=07687465470
    ...   cep=58070400
    ...   adressNumber=120
    ...   addressDetails=apto105
    ...   addressStreet=Rua Elias Cavalcanti de Albuquerque
    ...   addressDistrict=Cristo Redentor               
    ...   addressCityUf=João Pessoa/PB
    ...   url=i.jpg

    Start_session
    FILL SIGNUP FORM        ${dog_walker} 
    Submit signup form  
    Finish Session
#Popup to be            Recebemos o seu cadastro e em breve retornaremos o contato.
      

Não deve cadastrar se o cpf for incorreto
   [tags]          cpf_inv
   ${dog_walker}  Create Dictionary
    ...   name=Natanael
    ...   email=ngsneto@gmail.com
    ...   cpf=076874654aa
    ...   cep=58070400
    ...   adressNumber=120
    ...   addressDetails=apto105
    ...   addressStreet=Rua Elias Cavalcanti de Albuquerque
    ...   addressDistrict=Cristo Redentor               
    ...   addressCityUf=João Pessoa/PB
    ...   url=i.jpg

 #   Start_session
    FILL SIGNUP FORM        ${dog_walker} 
    Submit signup form  

Não devem cadastrar se os campos obrigatorios não forem preenchidos
    [tags]          required     #aqui representa a validação dos campos obrigatórios
   # ${dog_walker}  Create Dictionary
   #  ...   name=Natanael
   #  ...   email=ngsneto@gmail.com
   #  ...   cpf=076874654aa
   #  ...   cep=58070400
   #  ...   adressNumber=120
   #  ...   addressDetails=apto105
   #  ...   addressStreet=Rua Elias Cavalcanti de Albuquerque
   #  ...   addressDistrict=Cristo Redentor               
   #  ...   addressCityUf=João Pessoa/PB
   #  ...   url=i.jpg

  #  Start_session
   #  FILL SIGNUP FORM        ${dog_walker} 
    Submit signup form         

    Wait For Elements State     css=.alert-error >> text=Informe o seu nome completo  
    ...    visible        5

        Wait For Elements State     css=.alert-error >> text=Informe o seu melhor email
    ...    visible        5

        Wait For Elements State     css=.alert-error >> text=Informe o seu CPF
    ...    visible        5

        Wait For Elements State     css=.alert-error >> text=Informe o seu CEP
    ...    visible        5

        Wait For Elements State     css=.alert-error >> text=Informe um número maior que zero
    ...    visible        5


        Wait For Elements State     css=.alert-error >> text=Adcione um documento com foto (RG ou CHN)
    ...    visible        5


   # Finish Session

 Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]          additional_services
   ${dog_walker}  Create Dictionary
    ...   name=Natanael
    ...   email=ngsneto@gmail.com
    ...   cpf=07687465470
    ...   cep=58070400
    ...   adressNumber=120
    ...   addressDetails=apto105
    ...   addressStreet=Rua Elias Cavalcanti de Albuquerque
    ...   addressDistrict=Cristo Redentor               
    ...   addressCityUf=João Pessoa/PB
    ...   url=i.jpg
    ...   additional_service=Cuidar 

    Start_session
    FILL SIGNUP FORM        ${dog_walker} 
    Click                   xpath=//span[text()="${dog_walker}[additional_service]"]
    Submit signup form  
    Finish Session
      
Deve poder cadastrar um novo dog walker que sabe Adestrar os pets
    [Tags]          adestrar
   ${dog_walker}  Create Dictionary
    ...   name=Natanael
    ...   email=ngsneto@gmail.com
    ...   cpf=07687465470
    ...   cep=58070400
    ...   adressNumber=120
    ...   addressDetails=apto105
    ...   addressStreet=Rua Elias Cavalcanti de Albuquerque
    ...   addressDistrict=Cristo Redentor               
    ...   addressCityUf=João Pessoa/PB
    ...   url=i.jpg
    ...   additional_service=Adestrar 

    Start_session
    FILL SIGNUP FORM        ${dog_walker} 
    Click                   xpath=//span[text()="${dog_walker}[additional_service]"]
    Submit signup form  
    Finish Session
            