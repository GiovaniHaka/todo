import 'package:todo/globals/messages/languages/language.dart';

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
}
