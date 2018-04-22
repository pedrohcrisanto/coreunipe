# PMPB - Core

## Requisítos necessários:

* Ruby 2.4.1 ou Superior
* PostgreSQL
* Rails 5.1.4

## Funcionalidades

#### Modulo Recursos Humanos
- [x] Cadastro de usuários(Policiais)
- [x] Autenticação de usuários
- [x] Controle e Gerencialmento de Papeis(Roles) de Acesso Dinâmico

#### Documentação
- [ ] Documentação da aplicação
- [ ] Documentação de utilização da aplicação com screencasts

## Configuração do projeto

Clone o projeto

```sh
$ git clone git@bitbucket.org:em8dev/core-unipe.git
```

Instale as dependências
```sh
$ cd /core-unipe/
$ bundle update
```

Configurar acesso ao Banco de Dados
```sh
$ cp config/database.example.yml config/database.yml
$ nano config/database.yml
```

Adicione as configurações do PostgreSQL
host: IP ou domínio do servidor
port: porta que o serviço é executado
username: usuário do Banco
password: senha do usuário

Execute as migrações
```sh
$ rails db:create
$ rails db:migrate
$ rails db:seed
```


Execute a aplicação
```sh
$ ./bin/server
```

abra o seu browser e acesse `localhost:3000`

#### Informações Importantes (Antes de começar a desenvolver)

 - Para organização de branches, utlizamos o `gitflow`. Se não conhece, recomendo a leitura desse [blogpost](http://www.bpaulino.com.br/2016/03/10/03-git-branching-architecture/) sobre o assunto.
 - Utilizamos o [Bootstrap](http://getbootstrap.com/) como framework frontend de nossa aplicação.


## Primeiro Acesso

Abra seu Browser, de PREFERENCIA, [Google Chrome.](https://www.google.com/chrome/browser/desktop/index.html?brand=CHBD&gclid=CjwKCAjw5M3GBRATEiwAAUSTQh_VcdnoH-YpvWOgwcfbWBHOwme8GFdo8O_2wXGntX8jpaC931gUvRoCvvQQAvD_BwE) e va para `localhost:3000`

Você verá a tela de login da aplicação:


![Imgur](http://i.imgur.com/cxsW3Jf.jpg)

Para acessar como desenvolvedor, utilize o login:
```ruby
email: 'admin@pm.pb.gov.br'
senha: '12345678'
```

## Controle de Permissões

O controle de permissões da aplicação é gerado dinamicamente basedo nos controllers criados. Cada `action` de um controller cria uma nova permissão e essa permissão pode ser vista na tela de `Cadastrar Papel` onde serão listados todos os controllers e seus papais disponíveis. As actions REST default do Rails estão internacionalizadas, então você verá em português. Elas estão definidas no arquivo `pt-BR.yml`:

```sh
controllers:
  permissions: 'Papeis'
  units:       'Unidades Militares'
  users:       'Usuários'
  actions:
    new:       'Formulário de Cadastro'
    create:    'Salvar'
    edit:      'Formulário de Atualização'
    update:    'Atualizar'
    show:      'Vizualizar'
    index:     'Buscar/Listar'
    destroy:   'Excluir'
```
Para internacionalizar seus controllers e actions customizados, basta adicioná-los na lista citada.
Para cada Permissão temos `n` papeis atrelados a ela, onde você pode utilizar tanto a permissão como o papel para verificar o nível de acesso do usuário logado.
Um bom exemplo é o menu lateral da aplicação, onde utilizamos apenas a verificação da permissão `administrador` para renderizar o menu.

O ponto forte dessa implementação é que você como desenvolvedor não precisa se preocupar com definições de permissões para seus controllers e views, a aplicação fará isso automaticamente por você.

O único requisito necessário é criar seus controllers extendendo de `BaseController`.

## Atual Banco de Dados

![Imgur](http://i.imgur.com/NofQUmz.png)

Com o propósito de criar o core de nossa aplicação, essas são as atuais tabelas que refletem os `models` utilizados na aplicação.

Para utilizar o banco de dados, é preciso criar o arquivo `database.yml` que não está commitado no repositorio. apenas o arquivo `database.yml.exemple` está disponível. então crie uma copia desse arquivo, renomeie para `database.yml` e modifique as configurações de acordo com seu perfil.

Isso facilita na hora de colocar a aplicação em produção e não mudar configurações por engano.

## Licença

Esse software se utiliza da licença MIT:

Copyright (c) 2016 PMPB

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
