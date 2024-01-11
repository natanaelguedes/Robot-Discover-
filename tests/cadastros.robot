*** Settings ***
Documentation        Suite de testes do home page 
Library    Browser
Library  ScreenCapLibrary 
Library  OperatingSystem
Library  Screenshot

 
Resource         ../resources/base.resource
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
    ...   additional_service=Cuidar 

     Start_session           #ACRESCENTANDO ESTAS PALAVRAS NÃO NECESSITA COLOCA-LAS A BAIXO

     New Browser                                    browser=chromium        headless=False
     New Page                                       https://walkdog.vercel.app/signup
     Wait For Elements State                        form h1       visible          5000
     
     Get Text                               form h1    equal         Faça seu cadastro
  
     Fill Text                                      css=input[name=name]                             ${dog_walker}[name]
     Fill Text                                      css=input[name=email]                            ${dog_walker}[email]
     Get Text                                       css=input[name=cpf]                              
     Fill Text                                      css=input[name=cpf]                              ${dog_walker}[cpf]
#page-walker > form > fieldset:nth-child(3) > div:nth-child(3) > div:nth-child(2) > span
    
     Fill Text                                      css=input[name=cep]                              ${dog_walker}[cep]
     Click                                          css=input[type=button][value$=CEP]    
    #validando os campos       
    # Get Property                                   css=input[name=addressStreet]     value  equal   ${dog_walker}[addressStreet]  
    # Get Property                                   css=input[name=addressDistrict]   value  equal   ${dog_walker}[addressDistrict]       
    # Get Property                                   css=input[name=addressCityUf]     value  equal   ${dog_walker}[addressCityUf]       

     Fill Text                                      css=input[name=addressNumber]                   ${dog_walker}[adressNumber]
     Fill Text                                      css=input[name=addressDetails]                  ${dog_walker}[addressDetails]    
#vai em inspecionar elemento e clica em Style e em elements styles,  
# #desabilita o checkbox elements.styles com o nome display: none;
#EXECDIR identifica qualquer arquivo que esteja na raiz do projeto que nesse caso a raiz é XQAEXPERIENCE 
    Click                                            xpath=//span[text()="${dog_walker}[additional_service]"]
    Upload File By Selector                          css=input[type=file]                             ${EXECDIR}/resources/fixtures/${dog_walker}[url]                        
    Click                                            xpath=//span[text()="${dog_walker}[additional_service]"]
  
    Click                                          css=.button-register   # Input Text  
    # # submit form                                   xpath=//*[@id="page-walker"]/form/button         Cadastrar     
   # Get Text                                       css=.swal2-html-container        equal       Recebemos o seu cadastro e em breve retornaremos o contato.


    Sleep                                          60    #10
                        


#C:\Users\saonneto\UdemyAppiumAndRobotFramework-main\UdemyAppiumAndRobotFramework-main\XQAEXPERIENCE> 
# para roda basta digitar o comando 