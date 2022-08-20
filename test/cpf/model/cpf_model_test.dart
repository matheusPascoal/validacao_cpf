import 'package:flutter_test/flutter_test.dart';
import 'package:validator_cpf/cpf/model/cpf_mode_regra_de_negociol.dart';

void main() {
  var cpf = CpfModel('26408534066');
  print('Cpf valido: ${cpf.validate()}');

  cpf = CpfModel('11111111111');
  print('Cpf invalido pq tem numeros REPETIDOS: ${cpf.validate()}');

  cpf = CpfModel('2640853406');
  print('Cpf invalido pq tem menos q 11 numeros: ${cpf.validate()}');

  cpf = CpfModel('26408534065');
  print('Cpf invalido: ${cpf.validate()}');
}
