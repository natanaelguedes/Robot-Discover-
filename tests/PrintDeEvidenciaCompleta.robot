*** Settings ***
Documentation        Suite de testes do home page 
Library    Browser

 

Resource               ../resources/base.resource


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
      
