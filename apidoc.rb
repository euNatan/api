
URL "http://localhost:3000", #url da api
*CONTROLLERS #usado para definir qual controller estara em uso
    - contacts: name(string), email(string), phone(string), description(string)
    - items: name(string), price(float), description(string), image(string multpart), enable(boolean), user(integer), status(integer), category(integer)
    - statuses: name(string)
    - categories: name(string),	ancestry(integer),	weight(integer),	enable(boolean),	icon(string), user(integer)
*ID #id do CONTROLLER que sera usado
PATH
  #get all data from CONTROLLER
    "GET    /api/v1/CONTROLLER.json"

  #create CONTROLLER
    "POST   /api/v1/CONTROLLER.json"

    Para fazer qualquer ação sempre passe no header os valores de login X-User-Email e o token X-User-Token
    exemplo: criando um novo status
    curl -H "Content-Type: application/json" -H "X-User-Email: teste@teste.com" -H "X-User-Token: XNXJsstqSD5nEkp4NzG4"  -X POST -d '{ "name": "teste" }' http://localhost:3000/api/v1/statuses.json
    curl -H "Content-Type: application/json" -H "X-User-Email: teste@teste.com" -H "X-User-Token: XNXJsstqSD5nEkp4NzG4" -F 'image=@//Users/natan.nascimento/Desktop/leilao/produtos-imagens/onepiece-ace.jpg' -X POST -F '{ "name": "teste" }' http://localhost:3000/api/v1/statuses.json

-F upload=@localfilename
  #read unique CONTROLLER
    "GET    /api/v1/CONTROLLER/ID.json"

  #update CONTROLLER
    "PUT    /api/v1/CONTROLLER/ID.json"

  #delete CONTROLLER
    "DELETE /api/v1/CONTROLLER/ID.json"
