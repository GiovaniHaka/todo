import 'package:todo/globals/messages/languages/brazilian_portuguese.dart';
import 'package:todo/globals/messages/languages/language.dart';

class Messages {
  static late String _locale;
  late Language lang;

  Messages._();

  static final instance = Messages._();

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
