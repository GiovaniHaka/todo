import 'package:todo/globals/messages/messages.dart';

/// Classe que representa um validador.
class OnzeValidator {
  static String? emptyOrNull(String? value) {
    if (value == null || value.isEmpty) {
      return Messages.instance.lang.validatorEmptyOrNull;
    }

    return null;
  }
}
