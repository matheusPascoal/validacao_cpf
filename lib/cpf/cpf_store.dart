import 'package:flutter/cupertino.dart';
import 'package:validator_cpf/cpf/model/cpf_mode_regra_de_negociol.dart';

class CpfStore extends ChangeNotifier {
  String result = '';

  String? validateCPF(String? cpf, bool notify) {
    final model = CpfModel(cpf ?? '');
    var string = model.validate();
    result = string ?? '';
    if (notify) {
      notifyListeners();
    }

    return string;
  }
}
