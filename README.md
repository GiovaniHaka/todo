# TODO APP

Este aplicativo contém 2 telas:

- my_todos_screen: tela principal que exibe a lista de tarefas do usuário e um carrosel com as 3 tarefas mais próximas.

- create_todo_screen: tela para criar tarefa com título, data e imagem.

---
## Arquitetura

O projeto foi desenvolvido utilizando a arquitetura em camadas, sendo inspirada no livro Clean Architecture, Robert Cecil Martin. Esta arquitetura permite realizar um desenvolvimento baseado em testes, com criação de contratos e interfaces para classes, seguindo pricípios de responsabilidade única. São as camadas:

- data: contendo os datasources, repositories, models e mappers, que fazem conexão com dados externos.

- domain: camada que contém as entidades, casos de uso e repositories de cada funcionalidade.

- presentation: esta camada contém a interface do aplicativo, e realiza a interação direta com o usuário.

 Nas camadas de apresentação, foi utilizado o padrão MVC (Model, View e Controller), o que facilita a integração da interface com as camadas de domínio e modelos. 
 
 Também foi utilizado programação funcional, que facilita a propagação de informação através das camadas, bem como o tratamento e exibição de erros ao usuário. 
 
 Por fim, foi desenvolvido um gerencimento de estados, que permite alterar o estado da interface, através da interação do usuário com o aplicativo.

---
## Executando Aplicação

Para executar este aplicativo é necessário realizar a instalação prévia de Dart e Flutter em sua máquina. É possível realizar a instalação a partir da documentação oficial, encontrada [aqui](https://docs.flutter.dev/get-started/install). Este projeto foi desenvolvido em Flutter (3.3.7) e Dart (2.18.4), sendo assim, será necessária a instalação de versões semelhantes ou posteriores ao sdk utilizado. 

O projeto não possui dependências específicas para cada sistema operacional, portanto a execução do aplicativo será semelhante para Andorid e IOS. 

Inicie clonando o repositório em sua máquina.


<details><summary>iOS</summary><p>

1. Certifique-se que está executando o programa em um sitema Mac.

2. Certifique-se que a versão utilizada do XCode esteja atualizada e que o aplicativo esteja "assinado" com uma equipe.

3. Execute o Simulator (emulador iOS) em sua máquina, com sistema iOS igual ou superior a versão 14.0. Recomendado utilizar "iPhone 15".

4. No diretório do projeto (o mesmo diretório que se encontra o arquivo pubspec.yaml) execute o comando:
```
flutter pub get
```

5. Em seguida, ainda no mesmo diretório, para executar o programa no Simulator, execute o comando:
```
flutter run
```

Obs: na ocorrência de alguma falha, execute o comando ```flutter doctor``` para verificar qualquer problema de sdk ou instalações no framework.

</p></details>


<details><summary>Android</summary><p>

1. Certifique-se que possua Android Studio instalado, bem como as dependências e sdks do Android.

2. Execute o Android Emulator (emulador Android) em sua máquina, com sistema Adnroid igual ou superior ao sdk 30.0 (Android 11).

3. No diretório do projeto (o mesmo diretório que se encontra o arquivo pubspec.yaml) execute o comando:
```
flutter pub get
```

4. Em seguida, ainda no mesmo diretório, para executar o programa no emulador, execute o comando:
```
flutter run
```

Obs: na ocorrência de alguma falha, execute o comando ```flutter doctor``` para verificar qualquer problema de sdk ou instalações no framework.

</p></details>
