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
}
