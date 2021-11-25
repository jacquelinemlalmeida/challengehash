# README

Para rodar a aplicação é preciso ter instalado o Docker Cli e o Docker Compose.

Feito isso basta apenas clonar o projeto e na raiz dele executar: docker-compose build

Após a construção dos containers terminar é preciso subir eles executanto: docker-compose up

Pronto a aplicação está de pé local na sua máquina, agora pode brincar com ela utilizando algum
software para testar APIs, recomendo o Postman ou o Insomnia.

Para rodar os testes utilize: docker-compose run web rspec 

Obs: Não é preciso se preocupar com banco de dados pois foram gerados helpers para auxiliar na busca 
por informações no json utilizado como recurso de banco de dados, e por isso o ActiveRecord e
o ActiveStorage do Rails foi desabilitado.
