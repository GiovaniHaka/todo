import 'package:todo/globals/messages/languages/brazilian_portuguese.dart';
import 'package:todo/globals/messages/languages/language.dart';
/// Classe responsável por gerenciar as mensagens do aplicativo.
class Messages {
  static late String _locale;
  late Language lang;

  Messages._();

  static final instance = Messages._();

  /// Define o idioma das mensagens com base no local informado.
  ///
  /// Parâmetros:
  ///   - [locale]: O local do idioma a ser definido.
  void setLanguage(String locale) {
    _locale = locale;
    switch (_locale) {
      case 'pt_BR':
        lang = const BrazilianPortuguese();
        break;
      default:
        lang = const BrazilianPortuguese();
        break;
    }
  }
}
