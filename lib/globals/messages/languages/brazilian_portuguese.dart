import 'package:todo/globals/messages/languages/language.dart';

/// Classe que implementa a interface Language para o idioma Português Brasileiro.
class BrazilianPortuguese implements Language {
  const BrazilianPortuguese();

  @override
  String get notFoundRouteSubtitle =>
      'Talvez você esteja procurando por uma página que não existe mais.';

  @override
  String get notFoundRouteTitle => 'Esta página não existe';

  @override
  String get buttonBackToHome => 'Voltar para o início';

  @override
  String get buttonPickImage => 'Escolher imagem';

  @override
  String get createTodo => 'Criar tarefa';

  @override
  String get hintTodoTitle => 'Preencha o título da tarefa';

  @override
  String get todo => 'Tarefa';

  @override
  String get todos => 'Tarefas';

  @override
  String get title => 'Título';

  @override
  String get buttonCreateTodo => 'Criar tarefa';

  @override
  String get validatorEmptyOrNull => 'Este campo não pode ser vazio.';

  @override
  String get details => 'Detalhes';

  @override
  String get failureDefaultMessage =>
      'Não foi possível carregar as informações no momento. Por favor, tente novamente mais tarde ou entre em contato com o desenvolvedor.';

  @override
  String get failureTitle => 'Algo deu errado.';

  @override
  String get emptyTodos => 'Você não tem tarefas cadastradas.';

  @override
  String get buttonRemove => 'Remover';

  @override
  String get whatIsTodoDate => 'Quando você quer fazer essa tarefa?';

  @override
  String get date => 'Data';

  @override
  String get buttonChoose => 'Escolher';

  @override
  String get buttonChange => 'Alterar';

  @override
  String get myTodos => 'Minhas tarefas';
}
