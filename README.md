## ToDo APP

### Setup
Clone o repositório:
```
git clone https://github.com/damdrade/ToDo-App.git
```

### Bootstrap
O [Bootstrap](https://getbootstrap.com/) foi utilizado para estilizar as listas, a barra de navegação e a tela de login.

### Cadastro de usuários
A função de cadastro de usuários foi implementada através da utilização da gem `Devise` proporcionando que o usuário logado tenha o direito de editar apenas seu próprio conteúdo.

### Listas
O usuário logado pode criar uma lista pública ou privada, sendo que a lista pública pode ser vista por todos os usuários desse ambiente. Uma lista pode ser marcada como **Finalizada**, indicando que suas tarefas já foram concluídas, ou como **Favorita**.

Uma lista pode conter diversas tarefas e cada tarefa também podem ser marcada como **Finalizada** individualmente. Para realizar a associação das tarefas às listas foi utilizada a gem `Cocoon` que faz esta relação através de *nested attributes*.

### Testes
Os testes de desenvolvimento (TDD) foram realizados através das gems `RSpec` e `Capybara`.
